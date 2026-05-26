# WebGPU

WebGPU is a modern browser GPU API designed around concepts from Vulkan, Metal, and D3D12. It provides a safer and more portable explicit GPU model for the web, and it also has native implementations such as Dawn and wgpu-native.

It solves modern GPU access for browsers and can also be used natively through implementation libraries.

## What It Hides

- Native backend differences between Vulkan, Metal, D3D12, and other implementations.
- Some unsafe or overly explicit details that Vulkan exposes.
- Browser security and portability concerns.

## What It Exposes

- Adapters and devices.
- Queues.
- Buffers and textures.
- Bind groups.
- Render pipelines.
- Command encoders and render passes.

## In This Project

Planned paths:

- Browser WebGPU in JavaScript or TypeScript.
- Native WebGPU through Dawn or wgpu-native.
- Later C++ to browser WebGPU through Emscripten.

## Related Tools

WebGPU partially supersedes WebGL for new complex browser rendering, but WebGL remains useful for compatibility.

WebGPU is not a full Vulkan replacement. It is more portable and constrained, while Vulkan exposes more direct control.

