// fragment shader
#version 410 core

in float heightVal; 
out vec4 FragColor;

void main()
{
    FragColor = vec4(heightVal, heightVal, 1.0 - heightVal, 1.0);  // blue->white gradient
}