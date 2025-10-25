shader_type canvas_item;

//Noise Texture
uniform sampler2D Noise;
uniform sampler2D SCREEN_TEXTURE;

//Settings
uniform float Transparency = 4.0;
uniform float Slow = 25.0;

//Shader Code
void fragment() {
	COLOR = texture(SCREEN_TEXTURE, SCREEN_UV) * texture(Noise, texture(Noise, UV).xy + cos(TIME) / Slow) / Transparency;
}