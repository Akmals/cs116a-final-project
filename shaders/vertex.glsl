// vertex shader
#version 410 core

layout (location = 0) in vec3 aPos; //reads a vec3 from attribute index 0 and stores in shader variable aPos

uniform mat4 model; //object transform
uniform mat4 view;  //camera transform
uniform mat4 projection;   //perspective projection

out float heightVal; // output height value to fragment shader

void main()
{
    gl_Position = projection * view * model * vec4(aPos, 1.0);
    
    // Pass normalized height (0-1) to fragment shader
    // aPos.y ranges from 0 to heightScale (0.3), so normalize it
    heightVal = aPos.y / 0.3f; // Normalize to 0-1 range
}