vec4 getPixel(sampler2D channel, vec2 coord) {
	return texelFetch(channel, ivec2(coord), 0);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
	vec4 black = vec4(vec3(0.), 1.);
	vec4 pixel = getPixel(iChannel0, fragCoord);
	fragColor = mix(pixel, black, (1.-iFocus) * .98);
}
