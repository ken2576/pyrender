#version 330 core

layout(triangles) in;

layout(triangle_strip, max_vertices = 3) out;

out float to_discard;


void main()
{
    float THRHD = 0.015;
    float to_discard_t = 0.0;

    vec2 p0 = gl_in[0].gl_Position.xy / gl_in[0].gl_Position.w;
    vec2 p1 = gl_in[1].gl_Position.xy / gl_in[1].gl_Position.w;
    vec2 p2 = gl_in[2].gl_Position.xy / gl_in[2].gl_Position.w;

    if (distance(p0, p1) > THRHD ||
        distance(p1, p2) > THRHD ||
        distance(p2, p0) > THRHD)
        to_discard_t = 1.0;

    gl_Position = gl_in[0].gl_Position;
    to_discard = to_discard_t;
    EmitVertex();

    gl_Position = gl_in[1].gl_Position;
    to_discard = to_discard_t;
    EmitVertex();

    gl_Position = gl_in[2].gl_Position;
    to_discard = to_discard_t;
    EmitVertex();

    EndPrimitive();
}