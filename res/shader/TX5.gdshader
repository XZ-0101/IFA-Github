shader_type canvas_item;

// 亮度阈值
uniform float brightness_threshold : hint_range(0.0, 1.0) = 0.85;
// 平滑过渡范围
uniform float smoothness : hint_range(0.0, 0.5) = 0.1;

void fragment() {
    vec4 color = texture(TEXTURE, UV);

    // 计算亮度（使用标准亮度公式）
    float brightness = dot(color.rgb, vec3(0.299, 0.587, 0.114));

    // 平滑过渡的alpha值
    float alpha = smoothstep(brightness_threshold - smoothness,
                            brightness_threshold + smoothness,
                            brightness);

    // 反转变换，使高亮度像素透明
    color.a = color.a * (1.0 - alpha);

    COLOR = color;
}