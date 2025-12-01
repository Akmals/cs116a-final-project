// vertex shader (tessellation pipeline)
#version 410 core

layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoord;

out vec3 vPos;
out vec3 vNormal;
out vec2 vTexCoord;

void main()
{
    // Pass through to tessellation control shader
    vPos = aPos;
    vNormal = aNormal;
    vTexCoord = aTexCoord;
}
