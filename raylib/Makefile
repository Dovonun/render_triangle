CXX := g++
CXXFLAGS := -std=c++20 -Wall -Wextra -pedantic
TARGET := raylib_triangle

PKG_CONFIG := $(shell command -v pkg-config 2>/dev/null)
HAS_RAYLIB_PC := $(shell pkg-config --exists raylib 2>/dev/null && echo yes)

ifeq ($(HAS_RAYLIB_PC),yes)
RAYLIB_CFLAGS := $(shell pkg-config --cflags raylib)
RAYLIB_LIBS := $(shell pkg-config --libs raylib)
else
RAYLIB_CFLAGS := -I/usr/local/include
RAYLIB_LIBS := -L/usr/local/lib -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
endif

.PHONY: all clean

all: $(TARGET)

$(TARGET): main.cpp
	$(CXX) $(CXXFLAGS) $(RAYLIB_CFLAGS) $< -o $@ $(RAYLIB_LIBS)

clean:
	rm -f $(TARGET)
