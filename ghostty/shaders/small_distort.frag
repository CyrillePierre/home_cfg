vec2 toNormalized(vec3 res, vec2 coord) {
    return (coord - vec2(res.x-res.y, 0.)/2.) / res.yy;
}

vec4 getPixel(sampler2D channel, vec2 coord) {
	return texelFetch(channel, ivec2(coord), 0);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
	vec2 coord = fragCoord;
	coord.x += 1.3 * sin(fragCoord.y / 20.);
	coord.y += .4 * sin(fragCoord.x / 25.);

	vec4 pixel = getPixel(iChannel0, fragCoord);
	vec4 alt = getPixel(iChannel0, coord);
	fragColor = mix(pixel, alt, iFocus);
}
