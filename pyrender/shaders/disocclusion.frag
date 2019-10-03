#version 330 core

in float to_discard;

out vec4 frag_color;

void main()
{
    frag_color = vec4(1.0);

    if (to_discard > 0)
        frag_color = vec4(0, 1, 0, 1);
}
