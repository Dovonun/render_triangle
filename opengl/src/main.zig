const std = @import("std");

const c = @import("c");

const Io = std.Io;

// fn gladGlfwGetProcAddress(name: [*c]const u8) callconv(.C) ?*anyopaque {
//     const proc = c.glfwGetProcAddress(name) orelse return null;
//     return @ptrCast(proc);
// }
fn gladGlfwGetProcAddress(name: [*c]const u8) callconv(.C) ?*anyopaque {
    const proc = c.glfwGetProcAddress(name) orelse return null;
    return @constCast(@ptrCast(proc));
}

pub fn main() !void {
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    if (c.glfwInit() == 0) return error.GlfwInitFailed;
    defer c.glfwTerminate();

    const window = c.glfwCreateWindow(800, 600, "Zig + GLFW", null, null) orelse return error.GlfwCreateWindowFailed;
    defer c.glfwDestroyWindow();

    c.glfwMakeContextCurrent(window);
    // if (c.gladLoadGLLoader(@ptrCast(c.glfwGetProcAddress)) == 0) {
    //     return error.GladLoadFailed;
    // }
    if (c.gladLoadGLLoader(gladGlfwGetProcAddress) == 0) {
        return error.GladLoadFailed;
    }

    while (c.glfwWindowShouldClose(window) == 0) {
        c.glClearColor(0.1, 0.2, 0.3, 1.0);
        c.glClear(c.GL_COLOR_BUFFER_BIT);

        c.glfwSwapBuffers(window);
        c.glfwPollEvents();
    }
}
