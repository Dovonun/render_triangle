const std = @import("std");
const c = @import("c");

fn framebuffer_size_callback(_: ?*c.GLFWwindow, width: c_int, height: c_int) callconv(.c) void {
    c.glViewport(0, 0, width, height);
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
    if (c.gladLoadGLLoader(@constCast(@ptrCast(&c.glfwGetProcAddress))) == 0) return error.GladLoadFailed;

    _ = c.glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);
    c.glfwSwapInterval(1);

    var framebuffer_width: c_int, var framebuffer_height: c_int = .{ 0, 0 };
    c.glfwGetFramebufferSize(window, &framebuffer_width, &framebuffer_height);
    c.glViewport(0, 0, framebuffer_width, framebuffer_height);

    // VBO Setup

    const vertexShaderSource: [*c] const u8 =
        \\#version 330 core
        \\layout (location = 0) in vec3 aPos;
        \\out vec4 vertexColor;
        \\void main(){
        \\   gl_Position = vec4(aPos.x, aPos.y, aPos.z, 1.0);
        \\   vertexColor = vec4(0.5, 0.0, 0.0, 1.0);
        \\};
    ;

    const fragmentShaderSource: [*c] const u8 =
        \\#version 330 core
        \\layout (location = 0) in vec3 aPos;
        \\out vec4 vertexColor;
        \\void main(){
        \\   gl_Position = vec4(aPos.x, aPos.y, aPos.z, 1.0);
        \\   vertexColor = vec4(0.5, 0.0, 0.0, 1.0);
        \\};
    ;
    const vertices = [_]f32{ -0.5, -0.5, 0.0, 0.5, -0.5, 0.0, 0.0, 0.5, 0.0 };

    var VBO: c_uint = undefined;
    var VAO: c_uint = undefined;
    c.glGenBuffers(1, &VBO);
    c.glGenVertexArrays(1, &VAO);

    const vertexShader = c.glCreateShader(c.GL_VERTEX_SHADER);
    c.glShaderSource(vertexShader, 1, &vertexShaderSource, null);
    c.glCompileShader(vertexShader);

    const fragmentShader = c.glCreateShader(c.GL_FRAGMENT_SHADER);
    c.glShaderSource(fragmentShader, 1, &fragmentShaderSource, null);
    c.glCompileShader(fragmentShader);

    const shaderProgram = c.glCreateProgram();
    c.glAttachShader(shaderProgram, vertexShader);
    c.glAttachShader(shaderProgram, fragmentShader);
    c.glLinkProgram(shaderProgram);

    c.glDeleteShader(vertexShader);
    c.glDeleteShader(fragmentShader);

    // fill VAO
    c.glBindVertexArray(VAO);
    c.glBindBuffer(c.GL_ARRAY_BUFFER, VBO);
    c.glBufferData(c.GL_ARRAY_BUFFER, @sizeOf(@TypeOf(vertices)), &vertices, c.GL_STATIC_DRAW);
    c.glVertexAttribPointer(0, 3, c.GL_FLOAT, c.GL_FALSE, 3 * @sizeOf(f32), null);
    c.glEnableVertexAttribArray(0);

    while (c.glfwWindowShouldClose(window) == 0) {
        if (c.glfwGetKey(window, c.GLFW_KEY_ESCAPE) == c.GLFW_PRESS) c.glfwSetWindowShouldClose(window, 1);
        c.glClearColor(0.1, 0.2, 0.3, 1.0);
        c.glClear(c.GL_COLOR_BUFFER_BIT);

        c.glUseProgram(shaderProgram);
        c.glDrawArrays(c.GL_TRIANGLES, 0, 3);

        c.glfwSwapBuffers(window);
        c.glfwPollEvents();
    }
}
