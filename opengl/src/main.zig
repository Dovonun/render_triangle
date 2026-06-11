const std = @import("std");

const c = @import("c");

const Io = std.Io;
// TODO: This callback needs to be passed to the C lib. So how do I make this follow the c abi?
// extern fn framebuffer_size_callback(window c.GLFWwindow, width c_int, height c_int) {
//   glViewport(0, 0, width, height);
// }

fn gladGlfwGetProcAddress(name: [*c]const u8) callconv(.c) ?*anyopaque {
    const proc = c.glfwGetProcAddress(name) orelse return null;
    return @constCast(@ptrCast(proc));
}

pub fn main() !void {
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    if (c.glfwInit() == 0) return error.GlfwInitFailed;
    defer c.glfwTerminate();

    c.glfwWindowHint(c.GLFW_CONTEXT_VERSION_MAJOR, 3);
    c.glfwWindowHint(c.GLFW_CONTEXT_VERSION_MINOR, 3);
    c.glfwWindowHint(c.GLFW_OPENGL_PROFILE, c.GLFW_OPENGL_CORE_PROFILE);

    const window = c.glfwCreateWindow(800, 600, "Zig + GLFW", null, null) orelse return error.GlfwCreateWindowFailed;
    defer c.glfwDestroyWindow(window);

    c.glfwMakeContextCurrent(window);
    if (c.gladLoadGLLoader(gladGlfwGetProcAddress) == 0) {
        return error.GladLoadFailed;
    }
    // c.glfwSetFramebufferSizeCallback( window,);
    c.glfwSwapInterval(1);
    var framebuffer_width: c_int, var framebuffer_height: c_int = .{ 0, 0 };
    c.glfwGetFramebufferSize(window, &framebuffer_width, &framebuffer_height);
    c.glViewport(0, 0, framebuffer_width, framebuffer_height);

    while (c.glfwWindowShouldClose(window) == 0) {
        if (c.glfwGetKey(window, c.GLFW_KEY_ESCAPE) == c.GLFW_PRESS) c.glfwSetWindowShouldClose(window, 1);
        c.glClearColor(0.1, 0.2, 0.3, 1.0);
        c.glClear(c.GL_COLOR_BUFFER_BIT);

        c.glfwSwapBuffers(window);
        c.glfwPollEvents();
    }
}
