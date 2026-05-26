# SDL

SDL is a cross-platform development library for windows, input, audio, events, and other platform services. SDL 1.0 appeared in the late 1990s, and SDL2/SDL3 are widely used in games and multimedia tools.

SDL solves platform integration. It is not primarily a low-level 3D graphics API, though it can create windows for OpenGL and Vulkan and also provides simpler 2D rendering facilities.

## What It Hides

- OS-specific window creation.
- Input event differences.
- Audio and controller platform details.
- OpenGL context and Vulkan surface setup helpers.

## What It Exposes

- Windows.
- Events and input.
- Timing.
- Audio.
- OpenGL context creation.
- Vulkan window/surface support.

## In This Project

Use SDL to compare against GLFW as a platform layer for OpenGL and possibly Vulkan.

## Related Tools

SDL does not supersede OpenGL, Vulkan, or WebGPU. It complements them by providing the platform layer.

Compared with GLFW, SDL is broader. GLFW is more focused on windows, contexts, and input for graphics applications.

