#include <cstdio>

#include <glad/glad.h>

#include <GLFW/glfw3.h>
// float vertices[] = {
//     // first triangle
//      0.5f,  0.5f, 0.0f,  // top right
//      0.5f, -0.5f, 0.0f,  // bottom right
//     -0.5f,  0.5f, 0.0f,  // top left
//     // second triangle
//      0.5f, -0.5f, 0.0f,  // bottom right
//     -0.5f, -0.5f, 0.0f,  // bottom left
//     -0.5f,  0.5f, 0.0f   // top left
// };
float vertices[] = {-0.5f, -0.5f, 0.0f, 0.5f, -0.5f, 0.0f, 0.0f, 0.5f, 0.0f};
const char *vertexShaderSource =
    "#version 330 core\n"
    "layout (location = 0) in vec3 aPos;\n"
    "void main()\n"
    "{\n"
    "   gl_Position = vec4(aPos.x, aPos.y, aPos.z, 1.0);\n"
    "}\0";

const char *fragmentShaderSource = "#version 330 core\n"
                                   "out vec4 FragColor;\n"
                                   "void main(){\n"
                                   "FragColor = vec4(1.0f, 0.5f, 0.2f, 1.0f);\n"
                                   "}";

namespace {
void glfw_error_callback(int error, const char *description) {
  std::fprintf(stderr, "GLFW error %d: %s\n", error, description);
}

void framebuffer_size_callback(GLFWwindow *, int width, int height) {
  glViewport(0, 0, width, height);
}
} // namespace
//
void process_input(GLFWwindow *window) {
  if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
    glfwSetWindowShouldClose(window, true);
}

int main() {
  glfwSetErrorCallback(glfw_error_callback);

  if (!glfwInit()) {
    std::fprintf(stderr, "Failed to initialize GLFW\n");
    return 1;
  }

  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
  glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

  GLFWwindow *window =
      glfwCreateWindow(800, 600, "OpenGL triangle", nullptr, nullptr);
  if (window == nullptr) {
    std::fprintf(stderr, "Failed to create GLFW window\n");
    glfwTerminate();
    return 1;
  }

  glfwMakeContextCurrent(window);

  if (!gladLoadGLLoader(reinterpret_cast<GLADloadproc>(glfwGetProcAddress))) {
    std::fprintf(stderr, "Failed to initialize glad\n");
    glfwDestroyWindow(window);
    glfwTerminate();
    return 1;
  }

  glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);
  glfwSwapInterval(1);

  int framebuffer_width, framebuffer_height = 0;
  glfwGetFramebufferSize(window, &framebuffer_width, &framebuffer_height);
  glViewport(0, 0, framebuffer_width, framebuffer_height);

  // setup
  unsigned int VBO, VAO, vertexShader, fragmentShader, shaderProgram;

  glGenBuffers(1, &VBO);
  glGenVertexArrays(1, &VAO);

  vertexShader = glCreateShader(GL_VERTEX_SHADER);
  glShaderSource(vertexShader, 1, &vertexShaderSource, NULL);
  glCompileShader(vertexShader);

  fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
  glShaderSource(fragmentShader, 1, &fragmentShaderSource, NULL);
  glCompileShader(fragmentShader);

  shaderProgram = glCreateProgram();
  glAttachShader(shaderProgram, vertexShader);
  glAttachShader(shaderProgram, fragmentShader);
  glLinkProgram(shaderProgram);

  glDeleteShader(vertexShader);
  glDeleteShader(fragmentShader);

  // fill VAO
  glBindVertexArray(VAO);
  glBindBuffer(GL_ARRAY_BUFFER, VBO);
  glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
  glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void *)0);
  glEnableVertexAttribArray(0);
  glUseProgram(shaderProgram);

  glBindVertexArray(VAO);

  while (!glfwWindowShouldClose(window)) {
    process_input(window);

    glClearColor(0.91f, 0.00f, 1.00f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT);
    glDrawArrays(GL_TRIANGLES, 0, 3);

    glfwSwapBuffers(window);
    glfwPollEvents();
  }

  glfwDestroyWindow(window);
  glfwTerminate();
  return 0;
}
