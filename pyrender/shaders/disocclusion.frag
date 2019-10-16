#version 330 core

in float to_discard;
in float to_boundary;

out vec4 frag_color;

void main()
{
    frag_color = vec4(1.0);

    // if (to_boundary > 0)
    //     frag_color = vec4(1, 0, 0, 1);
    if (to_discard > 0)
        frag_color = vec4(to_discard, to_discard, to_discard, 1);
}
