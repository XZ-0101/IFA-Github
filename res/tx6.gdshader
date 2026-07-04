shader_type canvas_item;

uniform sampler2D overlay_texture : source_color;
uniform float white_threshold : hint_range(0.0, 1.0) = 0.9;
uniform float scale_x : hint_range(0.0, 10.0) = 1.0;
uniform float scale_y : hint_range(0.0, 10.0) = 1.0;
uniform vec2 overlay_offset = vec2(0.0, 0.0);
uniform bool overlay_repeat = true;

void fragment() {
    // 获取原始像素颜色
    vec4 original_color = texture(TEXTURE, UV);
    
    // 判断是否为白色（RGB 都大于阈值）
    bool is_white = all(greaterThan(original_color.rgb, vec3(white_threshold)));
    
    vec4 final_color = original_color;  // 默认保持原色
    
    if (is_white) {
        // 计算叠加纹理的自定义 UV
        vec2 overlay_uv = UV * vec2(scale_x, scale_y) + overlay_offset;
        
        if (overlay_repeat) {
            // 平铺模式：取小数部分
            overlay_uv = fract(overlay_uv);
            vec4 overlay_color = texture(overlay_texture, overlay_uv);
            final_color = vec4(overlay_color.rgb, original_color.a);
        } else {
            // 非平铺模式：检查 UV 是否在 [0,1] 范围内
            if (any(greaterThan(overlay_uv, vec2(1.0))) || any(lessThan(overlay_uv, vec2(0.0)))) {
                // 超出范围，保持原白色区域的颜色
                final_color = original_color;
            } else {
                vec4 overlay_color = texture(overlay_texture, overlay_uv);
                final_color = vec4(overlay_color.rgb, original_color.a);
            }
        }
    }
    // 非白色区域保持 original_color（已默认）
    
    COLOR = final_color;
}