#include <metal_stdlib>

using namespace metal;

struct VertexOut {
    float4 position [[position]];
};

struct FragmentOut {
    float4 color [[color(0)]];
    float depth [[depth(any)]];
};

vertex VertexOut vertexMain(ushort vid [[vertex_id]])
{
    int low = vid & 1;
    int high = vid >> 1;

    VertexOut out;

    out.position.x = (float(low) - 0.5f) * 2.0f;
    out.position.y = (float(high) - 0.5f) * 2.0f;
    out.position.z = 0.0f;
    out.position.w = 1.0f;

    return out;
}

fragment float4 fragmentMain(VertexOut in [[stage_in]],
                             constant float clear_color [[buffer(0)]])
{
    Fragment out;

    out.depth = clear_color;

    return out;
}