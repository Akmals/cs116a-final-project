// vertex shader
#version 410 core

layout (location = 0) in vec3 aPos; //reads a vec3 from attribute index 0 and stores in shader variable aPos
layout (location = 1) in vec3 aNormal;

uniform mat4 model; //object transform
uniform mat4 view;  //camera transform
uniform mat4 projection;   //perspective projection

out float heightVal; // output height value to fragment shader
out vec3 FragPos;
out vec3 Normal;

void main()
{
    vec4 worldPos = model * vec4(aPos, 1.0);
    FragPos = worldPos.xyz;

    Normal = mat3(transpose(inverse(model))) * aNormal;

    gl_Position = projection * view * worldPos;
    
    // Pass normalized height (0-1) to fragment shader
    // aPos.y ranges from 0 to heightScale (0.3), so normalize it
    heightVal = aPos.y / 0.3f; // Normalize to 0-1 range
}