CXX := g++
CXXFLAGS := -std=c++20 -Wall -Wextra -pedantic
TARGET := opengl_window
RECT_TARGET := opengl_rect
EX1_TARGET := opengl_ex1

GLFW_LIBS := -lglfw -ldl -lpthread -lm

.PHONY: all clean run

all: $(TARGET) $(RECT_TARGET) $(EX1_TARGET)

$(TARGET): main.cpp vendor/glad/src/glad.c
	$(CXX) $(CXXFLAGS) -Ivendor/glad/include $^ -o $@ $(GLFW_LIBS)

$(RECT_TARGET): rect.cpp vendor/glad/src/glad.c
	$(CXX) $(CXXFLAGS) -Ivendor/glad/include $^ -o $@ $(GLFW_LIBS)

$(EX1_TARGET): exercise_1.cpp vendor/glad/src/glad.c
	$(CXX) $(CXXFLAGS) -Ivendor/glad/include $^ -o $@ $(GLFW_LIBS)

run: $(TARGET)
	./$(TARGET)
rect: $(RECT_TARGET)
	./$(RECT_TARGET)
ex1: $(EX1_TARGET)
	./$(EX1_TARGET)

clean:
	rm -f $(TARGET) $(RECT_TARGET) $(EX1_TARGET)
