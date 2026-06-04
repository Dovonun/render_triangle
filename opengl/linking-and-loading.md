# OpenGL Linking And Loading

## Mental Model

OpenGL is a specification. A working program involves several separate pieces:

- Header: compile-time declarations, types, and constants.
- Loader/dispatch library: the system entry point, such as `libGL.so`, `libGLX.so`, or `libEGL.so`.
- Platform context API: GLX, EGL, WGL, or CGL.
- Driver/vendor implementation: Mesa, NVIDIA, AMD, or another implementation selected at runtime.
- Function loader: GLAD or a similar generated loader used by the application.

## Headers

Headers let the compiler understand names:

- `GLenum`, `GLuint`, `GLfloat`
- `GL_COLOR_BUFFER_BIT`
- `glClear`, `glViewport`, and other OpenGL entry points

Headers do not prove the runtime machine supports a specific OpenGL version.

## `libGL.so`

On Linux, `libGL.so` is the traditional OpenGL ABI entry point. On modern systems it is often provided by `libglvnd`, a vendor-neutral dispatch layer.

It can export OpenGL symbols such as `glClear` and `glViewport`, but it is not simply "the GPU driver". It routes work through the active platform and vendor driver path.

Linking with:

```sh
-lGL
```

means "make the OpenGL loader/dispatch library available to the linker".

It does not mean "this binary is guaranteed to use OpenGL 3.3".

## GLAD

GLAD generates application-side function pointer storage and loading code.

Conceptually:

```c
PFNGLCLEARPROC glad_glClear = NULL;
```

`gladLoadGLLoader(...)` fills those pointers at runtime after an OpenGL context exists.

With GLAD, a call such as:

```c
glClear(GL_COLOR_BUFFER_BIT);
```

usually becomes a call through a GLAD function pointer, not a direct link-time call to `libGL.so`.

That is why a binary can use OpenGL but still not show `libGL.so` in `ldd`: if no direct symbols from `libGL.so` are needed, the linker may drop `-lGL` because of `--as-needed`.

## Context Creation

OpenGL calls need a current context. GLFW hides the platform-specific context API.

Typical order:

```c
glfwCreateWindow(...);
glfwMakeContextCurrent(window);
gladLoadGLLoader((GLADloadproc)glfwGetProcAddress);
```

`glfwCreateWindow` creates a native window and, by default, an OpenGL context. For Vulkan-style usage, GLFW can create only a window:

```c
glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
```

## GLX, EGL, WGL, CGL

These are platform APIs that connect OpenGL to native windows/surfaces:

- GLX: Linux/Unix X11 OpenGL context API.
- EGL: Wayland, embedded, OpenGL ES, and also desktop OpenGL context API.
- WGL: Windows OpenGL context API.
- CGL/NSOpenGL: macOS OpenGL context APIs.

They choose pixel formats/configs, create contexts, make contexts current, swap buffers, and provide function lookup.

## Version Checks

The OpenGL version is a runtime property of the created context, not of the header or `libGL.so` file.

This is why tutorials ask for OpenGL 3.3 support even when GLAD is used:

- GLAD loads function pointers.
- GLAD does not upgrade the driver.
- GLAD does not guarantee the context supports OpenGL 3.3.

To check the runtime context version:

```sh
glxinfo -B
```

or query after context creation:

```c
glGetString(GL_VERSION);
```

## Direct `libGL` Use Vs GLAD

For old/common OpenGL functions, a program can often include `<GL/gl.h>`, link `-lGL`, and call functions directly.

For OpenGL 3.3 core tutorials and portable modern OpenGL, use GLAD or another loader. It gives one consistent path for versioned and extension-dependent entry points.

## Refresher Summary

- Header: lets code compile.
- `libGL.so`: OpenGL loader/dispatch ABI, not the version guarantee.
- GLX/EGL/WGL/CGL: platform context and surface APIs.
- GLFW: hides window and context setup.
- GLAD: fills function pointers after a context is current.
- Driver: actual OpenGL implementation selected at runtime.
- `ldd`: shows recorded ELF dependencies, not every library opened dynamically later.
