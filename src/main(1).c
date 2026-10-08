#include "game.h"
#include "sokol_app.h"
#include "sokol_gfx.h"
#include "sokol_glue.h"
#include "sokol_log.h"
#include "sokol_gl.h"
static void init(void){sg_setup(&(sg_desc){.environment=sglue_environment(),.logger.func=slog_func});sgl_setup(&(sgl_desc_t){.logger.func=slog_func});game_init();}
static void frame(void){sg_begin_pass(&(sg_pass){.action={.colors[0]={.load_action=SG_LOADACTION_CLEAR,.clear_value={0.07f,0.08f,0.11f,1.0f}}},.swapchain=sglue_swapchain()});game_frame((float)sapp_frame_duration());sg_end_pass();sg_commit();}
static void event(const sapp_event* ev){if(ev->type==SAPP_EVENTTYPE_KEY_DOWN)game_key(ev->key_code,true);if(ev->type==SAPP_EVENTTYPE_KEY_UP)game_key(ev->key_code,false);}
static void cleanup(void){game_cleanup();sgl_shutdown();sg_shutdown();}
sapp_desc sokol_main(int argc,char* argv[]){(void)argc;(void)argv;return (sapp_desc){.init_cb=init,.frame_cb=frame,.event_cb=event,.cleanup_cb=cleanup,.width=960,.height=540,.window_title="Sokol C Multiplatform",.icon.sokol_default=true,.logger.func=slog_func};}
