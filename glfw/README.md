# GLFW

GLFW is a small cross-platform library for creating windows, OpenGL contexts, Vulkan surfaces, and receiving input. It appeared in the early 2000s as a focused helper for graphics applications.

GLFW solves the window/context/input part of a rendering program without trying to become a full multimedia or game framework.

## What It Hides

- OS-specific window creation.
- OpenGL context setup.
- Vulkan surface creation helpers.
- Keyboard, mouse, and monitor platform differences.

## What It Exposes

- Windows.
- Events and input.
- OpenGL context management.
- Vulkan surface integration.

## In This Project

Use GLFW for the first direct OpenGL triangle and likely the first Vulkan triangle.

## Related Tools

GLFW does not supersede SDL. It is narrower and often simpler for graphics-focused examples.

SDL overlaps with GLFW for windows, input, OpenGL, and Vulkan surfaces, but SDL also covers more multimedia/game-platform features.

