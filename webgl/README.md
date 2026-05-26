# WebGL

WebGL is a browser graphics API based on OpenGL ES. WebGL 1.0 was released in 2011 to bring hardware-accelerated graphics to the web without plugins.

It solves browser-accessible GPU rendering through a JavaScript API and an HTML canvas.

## What It Hides

- Native window creation.
- Browser/OS graphics backend details.
- Some platform differences through the browser.

## What It Exposes

- OpenGL ES-style shaders, buffers, textures, and draw calls.
- Browser canvas integration.
- JavaScript-driven rendering loop.

## In This Project

WebGL is excluded from the one-native-language rule. Use JavaScript or TypeScript.

## Related Tools

WebGPU is the newer browser GPU API that partially supersedes WebGL for new advanced web graphics. WebGL remains widely deployed and useful, especially for compatibility and simpler browser rendering.

WebGL superseded plugin-era browser graphics approaches for many use cases.

