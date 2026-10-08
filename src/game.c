#include "game.h"
#include "collision.h"
#include "sokol_gfx.h"
#include "sokol_gl.h"

static struct 
{
	Rect player, obstacle;
	bool left,right,up,down;
} g;

void game_init(void)
{
	g.player=(Rect){-.75f,-.15f,.30f,.30f
	};
	g.obstacle=(Rect)
	{
		.20f,-.20f,.45f,.45f
	};
	g.left=g.right=g.up=g.down=false;
}

void game_key(sapp_keycode key,bool pressed){switch(key){case SAPP_KEYCODE_LEFT:g.left=pressed;break;case SAPP_KEYCODE_RIGHT:g.right=pressed;break;case SAPP_KEYCODE_UP:g.up=pressed;break;case SAPP_KEYCODE_DOWN:g.down=pressed;break;default:break;}}
static void update(float dt){const float speed=.9f;if(g.left)g.player.x-=speed*dt;if(g.right)g.player.x+=speed*dt;if(g.up)g.player.y+=speed*dt;if(g.down)g.player.y-=speed*dt;}
static void quad(Rect r){sgl_v2f(r.x,r.y);sgl_v2f(r.x+r.w,r.y);sgl_v2f(r.x+r.w,r.y+r.h);sgl_v2f(r.x,r.y+r.h);}
void game_frame(float dt){if(dt>.05f)dt=.05f;update(dt);bool hit=rect_intersects(g.player,g.obstacle);sgl_defaults();sgl_begin_quads();sgl_c4f(.07f,.08f,.11f,1);quad((Rect){-1,-1,2,2});if(hit)sgl_c4f(1,.15f,.15f,1);else sgl_c4f(.15f,.65f,1,1);quad(g.obstacle);sgl_c4f(.20f,1,.30f,1);quad(g.player);sgl_end();sgl_draw();}
void game_cleanup(void){}
