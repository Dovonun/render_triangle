CXX := g++
CXXFLAGS := -std=c++20 -Wall -Wextra -pedantic
TARGET := opengl_window

GLFW_LIBS := -lglfw -lGL -ldl -lpthread -lm

.PHONY: all clean run

all: $(TARGET)

$(TARGET): main.cpp
	$(CXX) $(CXXFLAGS) $< -o $@ $(GLFW_LIBS)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(TARGET)
