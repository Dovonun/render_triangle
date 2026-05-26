# Vulkan

Vulkan is a low-level graphics and compute API released as Vulkan 1.0 in 2016 by Khronos. It was created as a modern successor-style API for workloads that need explicit control, predictable performance, lower driver overhead, and better multithreaded command generation than classic OpenGL.

Vulkan solves GPU device access, explicit resource management, command submission, synchronization, and presentation through surfaces and swapchains. It still does not create the operating-system window itself.

## What It Hides

- Less than most graphics APIs.
- Hardware differences are abstracted, but memory, synchronization, and pipeline setup are intentionally explicit.

## What It Exposes

- Instance and extensions.
- Physical and logical devices.
- Queues.
- Surfaces and swapchains.
- Images, buffers, and memory allocation.
- Render passes or dynamic rendering.
- Pipelines.
- Command buffers.
- Semaphores, fences, and barriers.

## In This Project

Start Vulkan with GLFW or SDL creating the Wayland window and Vulkan surface. Native Wayland surface creation can come later if needed.

## Related Tools

Vulkan partially supersedes OpenGL for new high-performance native rendering engines, but not for every use case. OpenGL remains simpler for learning and small programs.

WebGPU is influenced by Vulkan, Metal, and D3D12, but it is not a direct replacement for Vulkan. It trades some explicit control for portability and safety.

NVRHI and Sokol can sit above Vulkan as abstraction layers.

