vec4 getPixel(sampler2D channel, vec2 coord) {
	return texelFetch(channel, ivec2(coord), 0);
}

vec2 hash22(in vec2 p) {
	vec3 p3 = fract(vec3(p.xyx) * vec3(.1031, .1030, .0973));
    p3 += dot(p3, p3.yzx+33.33);
    return fract((p3.xx+p3.yz)*p3.zy);
}

vec2 hash22i(ivec2 z) {
    int n = z.x+z.y*11111;

    n = (n<<13)^n;
    n = (n*(n*n*15731+789221)+1376312589)>>16;

    // Perlin style vectors
    n &= 7;
    vec2 gr = vec2(n&1,n>>1)*2.0-1.0;
    return (n>=6) ? vec2(0.0,gr.x) : 
           (n>=4) ? vec2(gr.x,0.0) : gr;
}

float gradientNoise(in vec2 p) {
    ivec2 i = ivec2(floor(p));
    vec2 f = fract(p);
	
	vec2 u = f*f*(3.0-2.0*f);

    return mix(
        mix(
            dot(hash22i(i+ivec2(0,0)), f-vec2(0.,0.)),
            dot(hash22i(i+ivec2(1,0)), f-vec2(1.,0.)),
            u.x
        ),
        mix(
            dot(hash22i(i+ivec2(0,1)), f-vec2(0.,1.)),
            dot(hash22i(i+ivec2(1,1)), f-vec2(1.,1.)),
            u.x
        ),
        u.y
    );
}

float fbm(in vec2 p) {
    mat2 h = mat2(1.2, 1.6, -1.6, 1.2);
    
    float f = 0.;
    f += .50 * gradientNoise(p); p *= h;
    f += .25 * gradientNoise(p); p *= h;
    f += .15 * gradientNoise(p); p *= h;
    f += .10 * gradientNoise(p); p *= h;
    
    return f;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord/iResolution.xy;
    uv *= vec2(iResolution.x/iResolution.y, 1.);
    uv *= 1. + 9. * iMouse.x / iResolution.x;
    
    float f = 0.;
    
    mat2 h = mat2(1.1, 1.2, -1.2, 1.1);
    
    f += .5 * gradientNoise(uv + .88 * vec2(iTime));
    uv *= h;
    f += .5 * gradientNoise(uv + .93 * vec2(0., -iTime));
    f = f * .5 + .5;
    
    float outline = smoothstep(.49, .495, f) - smoothstep(.51, .515, f);
    float ese_out = smoothstep(0.005, 0., abs(f-.5)-.01);
    
    outline = mix(outline, ese_out, step(fragCoord.x, 400.));
    // vec2 grid = step(-.05, fract(uv)) - step(.05, fract(uv));
    // f += max(grid.x, grid.y);
    
    f *= .9;
    f += .1 * fbm(uv+.7*iTime);
    
    vec3 col = 1.1 * vec3(f, .72*max(.65*outline, f), 1.-f-outline);
    //col = vec3(f);
    fragColor = mix(getPixel(iChannel0, fragCoord), vec4(col, 1.0), iFocus*0.2);
}
