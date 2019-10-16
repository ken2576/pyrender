#version 330 core

layout(triangles) in;

layout(triangle_strip, max_vertices = 3) out;

in VS_OUT {
    vec3 position;
    vec3 normal;
    vec4 camera_coordinates;
    vec3 look_at;
    mat4 mvp;
} gs_in[];

out float to_discard;
out float to_boundary;

void main()
{
    float THRHD = 0.008;
    float CAM_THRHD = 0.08;
    float to_discard_t = 0.0;
    float to_boundary_t = 0.0;

    // vec2 p0 = gl_in[0].gl_Position.xy / gl_in[0].gl_Position.w;
    // vec2 p1 = gl_in[1].gl_Position.xy / gl_in[1].gl_Position.w;
    // vec2 p2 = gl_in[2].gl_Position.xy / gl_in[2].gl_Position.w;

    // if (distance(p0, p1) > THRHD ||
    //     distance(p1, p2) > THRHD ||
    //     distance(p2, p0) > THRHD)
    //     to_discard_t = 1.0;

    // vec3 d0 = gs_in[0].camera_coordinates.xyz / gs_in[0].camera_coordinates.w;
    // vec3 d1 = gs_in[1].camera_coordinates.xyz / gs_in[1].camera_coordinates.w;
    // vec3 d2 = gs_in[2].camera_coordinates.xyz / gs_in[2].camera_coordinates.w;
    
    float d0 = gs_in[0].camera_coordinates.w / gs_in[0].camera_coordinates.z;
    float d1 = gs_in[1].camera_coordinates.w / gs_in[1].camera_coordinates.z;
    float d2 = gs_in[2].camera_coordinates.w / gs_in[2].camera_coordinates.z;

    vec3 p0 = gs_in[0].position.xyz;
    vec3 p1 = gs_in[1].position.xyz;
    vec3 p2 = gs_in[2].position.xyz;

    vec3 v0 = p0 - p1;
    vec3 v1 = p2 - p1;

    vec3 normal = normalize(cross(v1, v0));

    float ANGLE_THRHD = 0.1;
    vec3 look_at = (gs_in[0].look_at + gs_in[1].look_at + gs_in[2].look_at) / 3;
    float angle = abs(dot(normal, look_at));
    to_discard_t = angle;

    // if (distance(d0, d1) > CAM_THRHD ||
    //     distance(d1, d2) > CAM_THRHD ||
    //     distance(d2, d0) > CAM_THRHD)
    //     to_boundary_t = 1.0;

    gl_Position = gl_in[0].gl_Position;
    to_discard = to_discard_t;
    to_boundary = to_boundary_t;
    EmitVertex();

    gl_Position = gl_in[1].gl_Position;
    to_discard = to_discard_t;
    to_boundary = to_boundary_t;
    EmitVertex();

    gl_Position = gl_in[2].gl_Position;
    to_discard = to_discard_t;
    to_boundary = to_boundary_t;
    EmitVertex();

    EndPrimitive();
}