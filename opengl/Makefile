CXX := g++
CXXFLAGS := -std=c++20 -Wall -Wextra -pedantic
TARGET := opengl_window

GLFW_LIBS := -lglfw -ldl -lpthread -lm

.PHONY: all clean run

all: $(TARGET)

$(TARGET): main.cpp vendor/glad/src/glad.c
	$(CXX) $(CXXFLAGS) -Ivendor/glad/include $^ -o $@ $(GLFW_LIBS)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(TARGET)
