# Render Triangle Roadmap

Goal: render one colored triangle in a window with several graphics and platform tools, while learning what each layer contributes to the path from program code to pixels on screen.

The project favors understanding over one-to-one syntax comparison. Each example should follow the normal style of the tool it uses. The shared artifact is simple: a window containing one colored triangle.

## Current Direction

- Primary platform: Linux on Wayland.
- Primary native language: C++20, written mostly in a C-like style until cleanup patterns become useful.
- Browser APIs are exempt from the one-language rule and can use JavaScript or TypeScript.
- Builds should stay local and simple: `Makefile`, `build.sh`, or minimal CMake only when the dependency expects it.
- The assistant should guide, review code, explain layers, and help debug. The user will explicitly ask when files or implementations should be created.

## Shared Triangle Target

Keep the visual result similar across examples:

- One application window.
- One RGB vertex-colored triangle.
- Dark clear color.
- Render loop continues until the window is closed.

Do not force identical program structure. The point is to learn each tool's natural abstraction boundary.

## Progression

1. `raylib`
   - Fastest first visible result.
   - Learn what a beginner-friendly game/media library hides.

2. `opengl` with `glfw`
   - First direct shader, vertex buffer, vertex array, and draw-call path.
   - GLFW handles window and OpenGL context creation.

3. `opengl` with `sdl`
   - Same OpenGL rendering concepts through a different platform layer.
   - Useful for comparing GLFW and SDL.

4. `opengl` with native Wayland/EGL context creation
   - Learn what GLFW/SDL hide.
   - Since this machine uses Wayland and X11 is not a target, prefer EGL/Wayland over GLX/X11.

5. `vulkan` with a window/surface helper
   - Learn instance, physical device, logical device, queues, surface, swapchain, render pass, pipeline, command buffers, synchronization, and presentation.
   - Use GLFW or SDL at first so the first Vulkan lesson is not buried under Wayland boilerplate.

6. `sokol`
   - Compare a small cross-platform C abstraction after seeing raw OpenGL and some Vulkan concepts.
   - Notice which backend details are hidden and which graphics concepts remain.

7. `webgl`
   - Browser version of the OpenGL ES-style model.
   - Use JavaScript/TypeScript.

8. `webgpu`
   - Browser version of the modern explicit GPU model.
   - Use JavaScript/TypeScript first.

9. Native `webgpu`
   - Compare browser WebGPU to native WebGPU implementations such as Dawn or wgpu-native.

10. C++ to browser WebGPU
    - Later comparison: compile C++ toward the browser with Emscripten and compare this to native browser JavaScript/TypeScript WebGPU.

11. `nvrhi`
    - Engine-style rendering hardware interface.
    - Best explored after Vulkan/WebGPU concepts are familiar.

## Per-Example Notes

For each implementation, record:

- Which layers it uses: window system, context/device creation, swapchain or backbuffer, shaders, buffers, pipeline, draw call, presentation.
- Which parts are OS-specific.
- Which parts are GPU API-specific.
- Which parts are library convenience.
- Shader language and shader compilation path.
- Resource lifetime and cleanup model.
- Build command.
- Debugging/validation tools used.

## Linux Wayland Notes

Wayland is the display server protocol used by this machine. For native context creation:

- OpenGL usually reaches the screen through EGL on Wayland.
- Vulkan uses Wayland surface extensions such as `VK_KHR_wayland_surface`, though GLFW/SDL can create the surface for the application.
- GLFW and SDL are useful because they hide most window-system details while still allowing OpenGL or Vulkan rendering.

Vulkan has official window-system integration concepts, including surfaces and swapchains, but it still does not create the operating-system window itself.

