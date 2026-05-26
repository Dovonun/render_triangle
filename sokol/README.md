# Sokol

Sokol is a collection of small, cross-platform C header libraries for app setup, graphics, audio, debugging, and utility tasks. It is designed to be lightweight and easy to embed.

It solves the problem of writing compact cross-platform graphics/app code without directly targeting every backend yourself.

## What It Hides

- Backend selection and setup.
- Platform window/context details through `sokol_app.h`.
- Graphics backend differences through `sokol_gfx.h`.

## What It Exposes

- App lifecycle callbacks.
- Buffers, images, shaders, pipelines, passes, and draw calls.
- A small explicit graphics abstraction.

## In This Project

Use Sokol after OpenGL and Vulkan basics. It will be easier to judge once the hidden backend work is familiar.

## Related Tools

Sokol does not supersede OpenGL, Vulkan, Metal, D3D, SDL, or GLFW. It can sit above some of them as a small abstraction.

It overlaps with parts of SDL/GLFW for app/window setup and with custom renderer abstraction layers for graphics.

