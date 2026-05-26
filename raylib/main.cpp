#include "raylib.h"
#include "rlgl.h"

int main() {
    constexpr int screen_width = 800;
    constexpr int screen_height = 600;

    InitWindow(screen_width, screen_height, "raylib triangle");
    SetTargetFPS(60);

    while (!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(Color{0x18, 0x18, 0x18, 255});

        rlBegin(RL_TRIANGLES);
            rlColor4ub(80, 140, 100, 255);
            rlVertex2f(50.0f, 50.0f);
            rlVertex2f(100.0f, 440.0f);
            rlColor4ub(255, 0, 0, 255);
            rlVertex2f(150.0f, 150.0f);

            rlColor4ub(0, 80, 80, 255);
            rlVertex2f(400.0f, 120.0f);
            rlColor4ub(80, 210, 120, 255);
            rlVertex2f(220.0f, 440.0f);
            rlColor4ub(80, 140, 240, 255);
            rlVertex2f(580.0f, 100.0f);

            rlVertex2f(600.0f, 100.0f);
            rlVertex2f(650.0f, 300.0f);
            rlVertex2f(700.0f, 100.0f);
        rlEnd();

        rlBegin(RL_LINES);
            rlColor4ub(80, 255, 240, 255);
            rlVertex2f(580.0f, 100.0f);
            rlColor4ub(230, 80, 80, 255);
            rlVertex2f(580.0f, 130.0f);
            rlVertex2f(580.0f, 400.0f);
            rlVertex2f(580.0f, 440.0f);
        rlEnd();


        EndDrawing();
    }

    CloseWindow();
    return 0;
}
