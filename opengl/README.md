# OpenGL

OpenGL is a cross-platform graphics API first released in 1992. It was created to provide a vendor-neutral way to access hardware-accelerated 2D/3D graphics.

OpenGL solves rendering API access, not window creation. A program still needs a platform-specific context path or a helper library.

## What It Hides

- Many driver and hardware details.
- Some synchronization and memory placement details.
- Presentation details compared with Vulkan.

## What It Exposes

- Shaders.
- Buffers.
- Vertex arrays.
- Textures.
- Draw calls.
- Render state.

## In This Project

Planned paths:

- OpenGL with GLFW.
- OpenGL with SDL.
- OpenGL with native Wayland/EGL context creation.

The native Linux path should use Wayland/EGL, not X11/GLX, because this machine runs Wayland and X11 is not a project target.

## Related Tools

Vulkan and WebGPU partially overlap with OpenGL as newer explicit graphics APIs, but OpenGL remains useful for learning, compatibility, small tools, and simpler rendering programs.

OpenGL superseded older vendor-specific graphics APIs and workstation-era APIs for many cross-platform use cases, but it has not fully disappeared because its setup and mental model are still simpler than Vulkan.

## Notes

- [OpenGL linking and loading](./linking-and-loading.md)
