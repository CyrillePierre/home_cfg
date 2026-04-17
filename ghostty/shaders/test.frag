const float tau = 2 * 3.141592;
const float radius_squared = .2*.2;
const float reduced_brightness = .3;
const vec4 black = vec4(vec3(0.), 1.);

vec2 toNormalized(vec3 res, vec2 coord) {
    return (coord - vec2(res.x-res.y, 0.)/2.) / res.yy;
}

vec4 getPixel(sampler2D channel, vec2 coord) {
	return texelFetch(channel, ivec2(coord), 0);
}

float curve(float x) {
	return .5 * cos(x * tau) + .5;
}

vec2 hash22(vec2 st){
    st = vec2(dot(st, vec2(127.1, 311.7)), dot(st, vec2(269.5, 183.3)));
    return fract(sin(st) * 43758.5453123);
}

float hash21(vec2 v) {
    return fract(sin(dot(v, vec2(12.9898, 78.233))) * 43758.5453123);
}

float hash11(float n) { 
    return fract(sin(n) * 43758.5453);
}

float noise21(vec2 uv) {
	vec2 f = fract(uv);
	vec2 i = floor(uv);
	f = f * f * (3. - 2. * f);
	return mix(
		mix(hash21(i), hash21(i + vec2(1,0)), f.x),
		mix(hash21(i + vec2(0,1)), hash21(i + vec2(1,1)), f.x), f.y);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
	vec2 rect = iCurrentCursor.zw;
	vec2 st = (fragCoord - mod(iCurrentCursor.xy, rect)) / rect;

	// float time = noise21(iTime * .2 * vec2(1.33, 0.88) + floor(st));
	float time = iTime * .2;
	// time = .5;

	st = floor(st);
	float a = step(1., mod(st.x + st.y, 2.));
	float b = 1. - a;

	a *= curve(time);
	a += b * curve(time + .5);

	vec4 pixel = getPixel(iChannel0, fragCoord);
	// fragColor = mix(pixel, vec4(iBackgroundColor, 1.), a);
	fragColor = a * pixel;
}
