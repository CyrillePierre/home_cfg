vec4 getPixel(sampler2D channel, vec2 coord) {
	return texelFetch(channel, ivec2(coord), 0);
}

// https://www.shadertoy.com/view/sscBD2
void shader(out vec4 o, vec2 u) {
	vec2 p = floor(0.5 * iResolution.xy - u);
	float c = (1.0 - smoothstep(15.0, 16.0, length(p))) * smoothstep(9.0, 10.0, length(p));
	vec2 l = step(0.5, abs(p)) * step(0.5, abs(p + vec2(-p.y, p.x)));
	int i = int(4.0 + 4.0 * atan(p.x, p.y) / acos(-1.0)) & 7;
	int t = int(iTime * 8.0) & 7;
	o = c * l.x * l.y * vec4(i == t ? 0.845 : 0.3945);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
	vec4 pixel = getPixel(iChannel0, fragCoord);
	shader(fragColor, fragCoord);
	fragColor = mix(pixel, fragColor, fragColor.a * iFocus);
}
