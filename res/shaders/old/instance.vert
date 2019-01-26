#version 330 core
layout (location = 0) in vec3 position;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec2 texCoords;
layout (location = 3) in mat4 aInstanceMatrix;


out vec3 Normal;
out vec3 FragPos;
out vec2 TexCoords;

uniform mat4 view;
uniform mat4 projection;

void main()
{
    FragPos = vec3(aInstanceMatrix * vec4(position, 1.0f));
    Normal = mat3(transpose(inverse(aInstanceMatrix))) * normal;
    TexCoords = texCoords;
    gl_Position = projection * view *  vec4(FragPos, 1.0f);

}