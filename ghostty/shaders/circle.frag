const float M_PI = 3.141592;

vec2 toNormalized(vec3 res, vec2 coord) {
    return (coord - vec2(res.x-res.y, 0.)/2.) / res.yy;
}

vec4 getPixel(sampler2D channel, vec2 coord) {
	return texelFetch(channel, ivec2(coord), 0);
}

float dist_l(vec2 c, vec2 p, float n) {
	vec2 q = abs(p-c);
	vec2 qn = pow(q, vec2(n));
	return pow(qn.x + qn.y, 1./n);
}

float len_l(vec2 q, float n) {
	q = abs(q);
	vec2 qn = pow(q, vec2(n));
	//return .5/q.x-.15/q.y-.5;
	return pow(qn.x + qn.y, 1./n);
}

mat2 rotate2d(float a) {
	return mat2(cos(a), -sin(a), sin(a), cos(a));
}

float draw(vec2 c, vec2 uv, float r, float w, float n, float theta) {
	vec2 p = (uv-c) * rotate2d(theta);

	float d = len_l(p, 0.6+abs(mod(iTime, 4.)-2.));
	float v = 0.;
	v += smoothstep(r+.001, r-.001, d);
	v -= smoothstep(r-w+.001, r-w-.001, d);

	return v;
}

vec4 shader(in vec2 fragCoord) {
	vec2 uv = toNormalized(iResolution, fragCoord);
	vec3 col = vec3(0., 0., 0.);
	vec2 c = vec2(.5, .5);
	float r = .4;
	float w = .02;

	float k = mod(round(iTime*3.), 7.)+3.;
	k = 1.;
	for(float i = 0.; i < k; ++i) {
		float n = 0.6 + abs(mod(iTime, 4.)-2.);
		float theta = .25*iTime+M_PI/(k+1.)*i;
		theta = 0.;
		float v = draw(c, uv, r, w, n, theta);
		col.r = max(col.r, v)*9./255.;
		col.g = max(col.r, v)*108./255.;
		col.b = max(col.r, v)*108./255.;
	}

	return vec4(col, col.g);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
	vec4 pixel = getPixel(iChannel0, fragCoord);
	vec4 col = shader(fragCoord);
	fragColor = mix(pixel, col, col.a * iFocus);
}
