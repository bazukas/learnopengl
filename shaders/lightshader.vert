#version 330 core
#define NR_POINT_LIGHTS 4

layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform vec3[NR_POINT_LIGHTS] pointLightPos;

out vec3 FragPos;
out vec3 Normal;
out vec3[NR_POINT_LIGHTS] PointLightPos;
out vec2 TexCoords;

void main()
{
    gl_Position = projection * view * model * vec4(aPos, 1.0);
    FragPos = vec3(view * model * vec4(aPos, 1.0));
    Normal = mat3(transpose(inverse(view * model))) * aNormal;
    for (int i = 0; i < NR_POINT_LIGHTS; i++)
        PointLightPos[i] = vec3(view * vec4(pointLightPos[i], 1.0));
    TexCoords = aTexCoords;
} 
