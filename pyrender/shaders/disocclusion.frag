#version 330 core

in vec3 frag_position;
in vec3 frag_normal;
in vec3 look_at;

out vec4 frag_color;

void main()
{
    vec3 normal = normalize(frag_normal);
    float angle = 1 - abs(dot(normalize(frag_position), frag_normal));
    frag_color = vec4(angle, angle, angle, 1.0);
}
