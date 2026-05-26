# NVRHI

NVRHI is NVIDIA's Rendering Hardware Interface, a C++ abstraction over graphics APIs such as Vulkan, D3D11, and D3D12. It is meant for engine-style rendering code that should not be written directly against one backend everywhere.

It solves the problem of writing higher-level rendering systems while keeping multiple explicit graphics backends available underneath.

## What It Hides

- Backend-specific API calls.
- Some resource and pipeline boilerplate.
- Differences between supported graphics APIs.

## What It Exposes

- Engine-facing rendering concepts.
- Buffers, textures, pipelines, command lists, bindings, and passes.
- Backend selection and integration concerns.

## In This Project

NVRHI should come late. It is most useful after OpenGL, Vulkan, WebGPU, and Sokol have made the lower layers familiar.

## Related Tools

NVRHI does not supersede Vulkan or D3D12. It abstracts over them. It is closer to an engine-internal rendering layer than a beginner graphics API.

It overlaps conceptually with custom renderer abstraction layers that game engines often build for themselves.

