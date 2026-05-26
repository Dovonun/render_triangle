CXX := g++
CXXFLAGS := -std=c++20 -Wall -Wextra -pedantic
TARGET := raylib_triangle

PKG_CONFIG := $(shell command -v pkg-config 2>/dev/null)

ifeq ($(PKG_CONFIG),)
RAYLIB_CFLAGS := -I/usr/local/include
RAYLIB_LIBS := -L/usr/local/lib -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
else
RAYLIB_CFLAGS := $(shell pkg-config --cflags raylib)
RAYLIB_LIBS := $(shell pkg-config --libs raylib)
endif

.PHONY: all clean

all: $(TARGET)

$(TARGET): main.cpp
	$(CXX) $(CXXFLAGS) $(RAYLIB_CFLAGS) $< -o $@ $(RAYLIB_LIBS)

clean:
	rm -f $(TARGET)
