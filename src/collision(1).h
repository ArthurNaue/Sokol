#ifndef COLLISION_H
#define COLLISION_H
#include <stdbool.h>

typedef struct 
{
	float x,y,w,h;
} Rect;

bool rect_intersects(Rect a, Rect b);

#endif
