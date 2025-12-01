// tessellation evaluation shader
#version 410 core

layout (triangles, equal_spacing, ccw) in;

in vec3 tcPos[];
in vec3 tcNormal[];
in vec2 tcTexCoord[];

out float heightVal;
out vec3 FragPos;
out vec3 Normal;
out vec2 TexCoord;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
    // Interpolate position using barycentric coordinates
    vec3 p0 = gl_TessCoord.x * tcPos[0];
    vec3 p1 = gl_TessCoord.y * tcPos[1];
    vec3 p2 = gl_TessCoord.z * tcPos[2];
    vec3 pos = p0 + p1 + p2;
    
    // Interpolate normal using barycentric coordinates
    vec3 n0 = gl_TessCoord.x * tcNormal[0];
    vec3 n1 = gl_TessCoord.y * tcNormal[1];
    vec3 n2 = gl_TessCoord.z * tcNormal[2];
    vec3 normal = normalize(n0 + n1 + n2);
    
    // Interpolate UV coordinates using barycentric coordinates
    vec2 uv0 = gl_TessCoord.x * tcTexCoord[0];
    vec2 uv1 = gl_TessCoord.y * tcTexCoord[1];
    vec2 uv2 = gl_TessCoord.z * tcTexCoord[2];
    TexCoord = uv0 + uv1 + uv2;
    
    // Transform to world space
    vec4 worldPos = model * vec4(pos, 1.0);
    FragPos = worldPos.xyz;
    
    // Transform normal to world space
    Normal = mat3(transpose(inverse(model))) * normal;
    
    // Calculate final position
    gl_Position = projection * view * worldPos;
    
    // Pass normalized height (0-1) to fragment shader
    heightVal = pos.y / 0.3;
}
