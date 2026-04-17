const float move_duration = .15;
const float radius_squared = .2*.2;
const float reduced_brightness = .25;
const vec4 black = vec4(vec3(0.), 1.);

vec2 toNormalized(vec3 res, vec2 coord) {
    return (coord - vec2(res.x-res.y, 0.)/2.) / res.yy;
}

vec4 getPixel(sampler2D channel, vec2 coord) {
	return texelFetch(channel, ivec2(coord), 0);
}

float blend(float t) {
	return t*t * (3. - 2. * t);
}

float calc_brightness(in vec2 fragCoord) {
	vec2 uv = toNormalized(iResolution, fragCoord);

	vec2 prevCenterCoord = iPreviousCursor.xy + iPreviousCursor.zw / 2.;
	vec2 prevCenter = toNormalized(iResolution, prevCenterCoord);

	vec2 curCenterCoord = iCurrentCursor.xy + iCurrentCursor.zw / 2.;
	vec2 curCenter = toNormalized(iResolution, curCenterCoord);

	float t = iTime - iTimeCursorChange;
	float f = blend(clamp(t / move_duration, 0., 1.));
	vec2 center = mix(prevCenter, curCenter, f);

	vec2 d = uv - center;
	float level = 1. - smoothstep(.0, .012, dot(d, d) - radius_squared);

	float brightness = level * (1. - reduced_brightness) + reduced_brightness;

	return brightness;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
	float brightness = calc_brightness(fragCoord);

	vec4 pixel = getPixel(iChannel0, fragCoord);
	fragColor = mix(pixel, black, 1. - brightness);
}
