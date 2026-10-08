#ifndef GAME_H
#define GAME_H
#include <stdbool.h>
#include "sokol_app.h"

void game_init(void);
void game_frame(float dt);
void game_key(sapp_keycode key,bool pressed);
void game_cleanup(void);

#endif
