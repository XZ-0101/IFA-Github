shader_type canvas_item;

uniform float speed: hint_range(0.0, 1.0, 0.01)=2.0;
uniform float power:hint_range(0.0, 1.0, 0.01)=0.25;

float hash12(vec2 x){
	return fract(cos(mod(dot(x,vec2(13.9898,8.141)),3.14))*43758.5433);
}
float noise12(vec2 p){
	vec2 i = floor(p);
	vec2 f= fract(p);
	float a=hash12(i);
	float b=hash12(i+vec2(1.0,0.0));
	float c =hash12(i+vec2(0.0,1.0));
	float d =hash12(i+vec2(1.0));
	vec2 u= f*f*(3.0-2.0*f);
	return mix(mix(a,b,u.x),mix(c,d,u.x),u.y);
}

void fragment() {
	vec2 uv =UV;
	float time=TIME*speed;
	float slow_noise=noise12(vec2(time,uv.y*0.3));
	float fast_noise = noise12(vec2(time*10.0,uv.y*2.4))-0.5;
	fast_noise*=0.15;
	slow_noise=max(0.0,slow_noise-0.3)/0.7;
	float noise =slow_noise+fast_noise;
	float x=uv.x-pow(noise,2.0)*power;
	vec3 color =texture(TEXTURE,vec2(x,uv.y)).rgb;
	float interference=hash12(vec2(0.0,uv.y*time));
	color=mix(color,vec3(interference),noise*0.3);
	float scan=step(0.5,fract(FRAGCOORD.y*0.25));
	color*=1.0-scan*noise*0.3;
	float shift =noise*0.05;
	float g=texture(TEXTURE,vec2(x+shift,uv.y)).g;
	float b=texture(TEXTURE,vec2(x-shift,uv.y)).b;
	color.g=mix(color.r,g,0.25);
	color.b=mix(color.r,b,0.25);
	COLOR=vec4(color,1.0);
	
}


