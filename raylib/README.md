# raylib

raylib is a beginner-friendly C library for games, visual experiments, simple tools, and teaching. It solves the problem of getting a window, input, drawing, textures, audio, and a game-style loop running with very little setup.

It started in 2013 as an educational library. It is still useful when fast iteration and low ceremony matter more than direct control over the graphics backend.

For this project, raylib is the baseline: the fastest way to put a triangle in a window and see what a high-level library hides.

## What It Hides

- Window creation details.
- Graphics context/device setup.
- Render loop conventions.
- Basic draw helpers.
- Some platform differences.

## What It Exposes

- A simple application loop.
- Immediate-style drawing functions.
- Optional access to lower-level concepts if needed later.

## Related Tools

raylib does not supersede OpenGL, Vulkan, SDL, or GLFW. It sits above them conceptually. It is a productivity and learning layer, not a replacement for understanding lower-level rendering APIs.

Newer or lower-level tools such as Vulkan/WebGPU solve different problems: explicit GPU control, modern pipeline models, and lower CPU overhead.

## Build

Install raylib first, then run:

```sh
make
./raylib_triangle
```

The Makefile uses `pkg-config --cflags --libs raylib`.

