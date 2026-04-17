vec2 toNormalized(vec3 res, vec2 coord) {
    return (coord - vec2(res.x-res.y, 0.)/2.) / res.yy;
}

vec4 getPixel(sampler2D channel, vec2 coord) {
	return texelFetch(channel, ivec2(coord), 0);
}

void shader(inout vec4 fragColor, in vec2 fragCoord) {
	vec2 coord = fragCoord - vec2(iCurrentRect.x, iCurrentCursor.y - iCurrentCursor.w);
	vec2 l = step(coord, vec2(0));
	vec2 h = step(coord, vec2(iCurrentRect.z, iCurrentCursor.w));
	vec2 v = clamp(h - l, vec2(0), vec2(1));

	fragColor.rgb *= .8 * vec3(floor((v.x + v.y) / 2.)) + .2;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
	vec4 pixel = getPixel(iChannel0, fragCoord);
	fragColor = pixel;
	shader(fragColor, fragCoord);
	fragColor = mix(pixel, fragColor, fragColor.a * iFocus);
}
