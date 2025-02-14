using RaylibBeef;
using static RaylibBeef.Raylib;

using static RaylibAsepriteBeef.RaylibAseprite;

using System;

namespace example;

class Program
{
	public static void Main()
	{
		InitWindow(800, 600, scope $"Raylib Beef {RAYLIB_VERSION_MAJOR}.{RAYLIB_VERSION_MINOR}.{RAYLIB_VERSION_PATCH}");
		InitAudioDevice();

		SetTargetFPS(60);

		Aseprite george = LoadAseprite("res/george.aseprite");
		AsepriteTag walking = LoadAsepriteTag(george, "Walk-Down");

		const float scale = 4;
		Vector2 position = .(
		    GetScreenWidth() / 2 - GetAsepriteWidth(george) / 2 * scale,
		    GetScreenHeight() / 2 - GetAsepriteHeight(george) / 2 * scale
		);

		while (!WindowShouldClose())
		{
			UpdateAsepriteTag(&walking);

			BeginDrawing();

			ClearBackground(RAYWHITE);

			DrawFPS(20, 20);

			DrawAseprite(george, 0, 100, 100, WHITE);
			DrawAseprite(george, 4, 100, 150, WHITE);
			DrawAseprite(george, 8, 100, 200, WHITE);
			DrawAsepriteFlipped(george, 12, 100, 250, false, true, WHITE);

			DrawAsepriteTagEx(walking, position, 0, scale, WHITE);

			DrawCircle(GetMouseX(), GetMouseY(), 8, RED);

			EndDrawing();
		}

		UnloadAseprite(george);

		CloseAudioDevice();
		CloseWindow();
	}
}