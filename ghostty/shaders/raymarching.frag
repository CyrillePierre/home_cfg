//#define MOUSE_ROT
//#define HARD_SHADOW

// patch for some OS/browser
#define pow(x, n) pow(abs(x), n)

/** structures **/
struct Light {
	vec3 ambient;
    
    vec3 diffuse;
    vec3 diffuseColor;
};
    
struct Material {
	vec4 color;
    float ir;
    vec2 refl;
    
    float ka, kd, ks, s;
};
    
/** util **/
vec2 toUV(vec3 res, vec2 coord) {
    return (coord - res.xy/2.) / res.yy;
}

mat2x2 rot(float a) {
    return mat2x2(cos(a), sin(a), -sin(a), cos(a));
}

vec3 refract2(vec3 rd, vec3 n, float ir) {
	if(dot(rd, n) < 0.) return refract(rd, n, 1./ir);
    else				return refract(rd, -n, ir);
}

vec4 getPixel(sampler2D channel, vec2 coord) {
	return texelFetch(channel, ivec2(coord), 0);
}

vec4 getPixel(sampler2D channel, ivec2 coord) {
	return texelFetch(channel, coord, 0);
}

bool keyState(sampler2D channel, int key) {
    return texelFetch(channel, ivec2(key, 2), 0).x > .5;
}

bool keyState(sampler2D channel, int k1, int k2) {
    return keyState(channel, k1) || keyState(channel, k2);
}

bool keyPressedOnce(sampler2D channel, int key) {
	return texelFetch(channel, ivec2(key, 1), 0).x > .5;
}

bool keyPressedOnce(sampler2D channel, int k1, int k2) {
	return keyPressedOnce(channel, k1) || keyPressedOnce(channel, k2);
}

bool keyPressed(sampler2D channel, int key) {
    return texelFetch(channel, ivec2(key, 0), 0).x > .5;
}

#define KEY_SHIFT	16
#define KEY_CTRL	17
#define KEY_SPACE	32
#define KEY_0		48, 96
#define KEY_1		49, 97
#define KEY_2		50, 98
#define KEY_3		51, 99
#define KEY_4		52, 100

#define KEY_A		65
#define KEY_D		68
#define KEY_E		69
#define KEY_F		70
#define KEY_G		71
#define KEY_H		72
#define KEY_Q		81
#define KEY_S		83
#define KEY_T		84
#define KEY_X		88
#define KEY_Z		90

const ivec2 infoCameraPos = ivec2(0,0);
const ivec2 infoCameraRot = ivec2(0,1);

/** sdfs **/
float sdSphere(vec3 p, float r) {
	return length(p)-r;
}

float sdPlane(vec3 p, vec3 q) {
    vec3 o = p*q;
    return max(o.x, max(o.y, o.z));
}

float sdBoxExact(vec3 p, vec3 b) {
  vec3 d = abs(p) - b/2.;
  return length(max(d,0.0)) + min(max(d.x,max(d.y,d.z)),0.0);
}

float sdBox(vec3 p, vec3 c) {
    vec3 a = abs(p) - c/2.;   
	return max(a.x, max(a.y, a.z));
}

float sdCylinderRevExact(vec3 p, float r, float h) {
  vec2 d = abs(vec2(length(p.xz),p.y)) - vec2(r,h/2.);
  return min(max(d.x,d.y),0.0) + length(max(d,0.0));
}

float sdCylinderRev(vec3 p, float r, float h) {
	return max(length(p.xz)-r, abs(p.y)-h/2.);
}

float sdCylinderRev(vec3 p, float ir, float or, float h) {
	return max(max(length(p.xz)-or, -length(p.xz)+ir), abs(p.y)-h/2.);
}

float sdCone(vec3 p, float a, float h) {
    return max(dot(vec2(sin(a), cos(a)), vec2(length(p.xz), -p.y)), p.y-h);
}

float sdTorus(vec3 p, float ir, float or) {
	return length(vec2(length(p.xz)-or, p.y))-ir;
}

float sdCapsule(vec3 p, float l, float r) {
    vec3 offset = vec3(0,0,l/2.);
    vec3 q = p;
    q.yz *= rot(radians(90.));
	return min(sdCylinderRev(q, r, l),
               min(sdSphere(p+offset, r), sdSphere(p-offset, r)));
}

/** processing **/
const float epsilon = 1e-3;
const int rayStepMax = 150;

/*************/
/* Materials */
/*************/
Material materialAt(int id, vec3 p) {
	vec2 uv = floor(p.xz*1.);
    
    return Material[](
        Material(vec4(.5*vec3(mod(uv.x+uv.y, 2.)), 1.), 1., vec2(-1., 5.), 1., 1., 1., 100.),
    	Material(vec4(vec3(.7), .0), 1.07, vec2(.35, 5.), 0., 0., 0., 100.),
        Material(vec4(vec3(1,0,0), 1.), 1., vec2(.0, 1.), 1., 1., 1., 100.),
        Material(vec4(vec3(1), 1.), 1., vec2(.07, 1.5), 1., 1., 1., 100.),
        Material(vec4(vec3(0), 1.), 1., vec2(-.1, .5), 1., 1., 1., 100.),
        Material(vec4(0),0.,vec2(0.),0.,0.,0.,0.)
    )[id];
}

/***********/
/* Objects */
/***********/
vec2 sdf(vec3 p, float limit) {
    vec3 q = p-vec3(0,0,0);
    q.xz *= rot(iTime);
    q.yz *= rot(iTime/4.);
    
    vec3 p3 = p-vec3(-2,0,0);
    p3.xz *= rot(-iTime/2.);

    int size = 5;
    float ds[] = float[](
        sdPlane(p-vec3(0, -1, 0), vec3(0,1,0)),
        sdSphere(p-vec3(2, 0, 0), .7),
    	sdCylinderRevExact(q , .5, .8),
        sdBoxExact(p-vec3(0,1,2), vec3(8,2,.1)),
        sdBoxExact(p3-vec3(0,0,0), vec3(1)),
        1000.
    );
    
    float m = sdSphere(p-vec3(1.5, 0, 0), .6);
    
    int id = 1;
    float d = ds[0];
    for(int i = 1; i < size; ++i) {
        float cd = ds[i];
        //cd = max(ds[i], -m);
        if(cd < d) {
            id = i+1;
        	d = cd;
        }
    }

	if(d > limit) id = 0;
    
	return vec2(id, d);
}

float sdf(vec3 p) {
	return sdf(p, 1000.).y;
}

vec3 normalTo(vec3 p) {
    const vec2 zo = vec2(0, 1);
    const float offset = 1e-4;
    vec3 n = vec3(
        sdf(p+offset*zo.yxx)-sdf(p-offset*zo.yxx),
        sdf(p+offset*zo.xyx)-sdf(p-offset*zo.xyx),
        sdf(p+offset*zo.xxy)-sdf(p-offset*zo.xxy)
    );
    return normalize(n);
}

vec2 rayProcess(vec3 cam, vec3 rd) {
	float t = .0;

    for(int i = 0; i < rayStepMax; ++i) {
		vec2 cur = sdf(cam + t * rd, 40.);
        if(cur.x < epsilon) return vec2(0);
        float h = abs(cur.y);
        if(h < epsilon) return vec2(cur.x, t);
        t += h;
    }
    
    return vec2(0);
}

#ifndef HARD_SHADOW
float processShadow(Light light, vec3 p, float mint, float maxt, float k) {
    vec3 rd = normalize(light.diffuse-p);
    float shadow = 1.;
    float ph = 0.;
    
    for(float t = mint; t < maxt;) {
        float h = sdf(p + rd*t);
        if(h<epsilon) return 0.;
        
        float y = h*h/(2.*ph);
        float d = sqrt(h*h-y*y);
        shadow = min(shadow, k*d/max(0.0,t-y));
        if(shadow < epsilon) return shadow;
        
        ph = h;
        t += h;
    }
    
    return shadow;
}
#else
float processShadow(Light light, vec3 p, float mint, float maxt, float k) {
    vec3 rd = normalize(light.diffuse-p);
    vec2 rp = rayProcess(p+epsilon*rd, rd);
    return rp.x > 0.? 0.:1.;
}
#endif

vec3 processColor(Light light, Material material, vec3 p, vec3 d, vec3 normal) {
    vec3 color = material.color.rgb;
    vec3 H = normalize(light.diffuse-d);

	vec3 ambient = light.ambient * color;
    vec3 diffuse = max(0., dot(normal, normalize(light.diffuse))) * light.diffuseColor * color;
    vec3 specular = max(0., pow(dot(normal, H), material.s)) * .1*vec3(1);
    
    float shadow = 1.;
    
    shadow = processShadow(light, p, 10.*epsilon, 1e2, 10.);
    
    return (material.ka * ambient + material.kd * diffuse * shadow + material.ks * specular);
}

vec3 calcReflection(vec3 cam, Light light, vec3 rd, int n) {
    vec3 rColor = vec3(0);
    
    vec3 p = cam;
    vec3 d = rd;
    float l = 1.;
    
    for(int i = n; i > 0 && l > epsilon; --i) {
    	vec2 rp = rayProcess(p, d);
        int id = int(rp.x)-1;
        
        if(id < 0) break;
        
        vec3 t = p + d * rp.y;
        Material material = materialAt(id, t);
        vec3 color = material.color.rgb;
        vec3 normal = normalTo(t);
        
        // calc
        float f = clamp(pow(1.-abs(dot(d, normal)), material.refl.y) + material.refl.x, 0., 1.);

        vec3 aCol = processColor(light, material, t, d, normal);

        rColor += aCol*l*(1.-f);
        l *= f;

        d = reflect(d, normal);
        p = t + 2.*epsilon*d;
    }
    
    return rColor;
}

vec3 shading(vec3 cam, Light light, vec3 rd, int n) {
    vec3 rColor = vec3(0);
    
    vec3 p = cam;
    vec3 d = rd;
    float l = 1.;
    
    for(int i = n; i > 0 && l > epsilon; --i) {
    	vec2 rp = rayProcess(p, d);
        int id = int(rp.x)-1;
        
        if(id < 0) break;
        
        vec3 t = p + d * rp.y;
        Material material = materialAt(id, t);
        vec3 color = material.color.rgb;
        vec3 normal = normalTo(t);
        
        // calc
        float f = clamp(pow(1.-abs(dot(d, normal)), material.refl.y) + material.refl.x, 0., 1.);
        float alpha = material.color.a;

        vec3 lCol = calcReflection(t, light, d, i);
        vec3 aCol = processColor(light, material, t, d, normal);

        rColor += (lCol*f + aCol*(1.-f)*alpha) * l;
        l *= (1.-f)*(1.-alpha);

        //p = t - sign(dot(d, normal))*normal;
        p = t + 2.1*epsilon*sign(dot(d, normal))*normal;

        d = refract2(d, normal, material.ir);
    }
    
    return rColor;
}

vec3 getCamera() {
	return vec3(0., 0., 4.);
}

#ifndef MOUSE_ROT
vec2 getCameraRot() {
	return vec2(radians(15.), radians(180.));
}
#else
vec2 getCameraRot() {
	return vec2((-iMouse.y / iResolution.y + .2) * 3. + 1.7, -iMouse.x / iResolution.x * 7.);
}
#endif

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = toUV(iResolution, fragCoord);
    
    vec3 cam = getCamera();
    vec2 camrot = getCameraRot();
    
    cam.yz *= rot(camrot.x);
    cam.xz *= rot(camrot.y);
    
    float aov = radians(90.);
    float f = iResolution.x/iResolution.y/2./tan(aov/2.);
    
    vec3 rd = normalize(vec3(uv, -f));
    rd.yz *= rot(camrot.x);
    rd.xz *= rot(camrot.y);
  
    Light light = Light(
        vec3(.6),
        vec3(5,10,0), vec3(.7)
   	);

    vec4 col = vec4(shading(cam, light, rd, 5), 1.);
		fragColor = getPixel(iChannel0, fragCoord);
		fragColor = mix(fragColor, col, .3);
}
