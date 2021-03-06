#version 330 core

// Inputs
layout(location = 0) in vec3 position;
layout(location = NORMAL_LOC) in vec3 normal;
layout(location = INST_M_LOC) in mat4 inst_m;

// Uniform data
uniform mat4 M;
uniform mat4 V;
uniform mat4 P;

// Output data
out vec3 frag_position;
out vec3 frag_normal;
out vec3 look_at;

// Render loop
void main()
{
    gl_Position = P * V * M * inst_m * vec4(position, 1.0);
    frag_position = vec3(M * inst_m * vec4(position, 1.0));

    mat4 N = transpose(inverse(M * inst_m));
    frag_normal = normalize(vec3(N * vec4(normal, 0.0)));
}