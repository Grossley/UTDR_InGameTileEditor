scr_get_font_to_use()
mode = 0
turn_off_text_for_Shesez = false
preset_index = 0
persistentid = -1
stop = 0
use_user_defined = 0
user_defined_preset_depth = 0
prev_attempt = 0
cur_attempt = 0
attempt_count = 0
global.myxb = 0
global.myyb = 0
interrupted = 0
preview_tile_set = 0
preview_tile = 0
del_tile_lock = 0
dup_lock = 0
grid_toggle = 0
grid_tile_lock = 0
old_tile_x_pos = 0
old_tile_y_pos = 0
global.screenshot = 0
tiles[0] = 0
parse_rooms_on_load = 1
debug_file = file_text_open_write("safe_file")
file_text_writeln(debug_file)
file_text_close(debug_file)
safe_path = filename_path("safe_file")
file_delete("safe_file")
global.to_joyconfig = 0
persist_values = 0
preview_tiles_enabled = 0
tile_get_mode = 1
drag_null_lock = 0
del_null_lock = 0
tilex_tl = 0
tiley_tl = 0
tilex_br = 0
tiley_br = 0
thetilecounter = 0
freecam = 0
current_temp_save_value = 0
add_lock = 0
reset_prev_tile = 0
add_preset_from_tile_mode = 0
write_preset_file_loc = "lg"
tile_count = ""
c_tile_id = ""
bg_name = ""
c_tile_left = ""
c_tile_top = ""
c_width = ""
c_height = ""
c_xscale = ""
c_yscale = ""
c_tile_alpha = ""
c_tile_blend = ""
c_tile_visible = ""
c_tile_depth = ""
c_tile_x_pos = ""
c_tile_y_pos = ""
bulk_delete_enabled = 0
strip_nan = 1
if (!file_exists("waiting_music.ogg"))
{
    wait = buffer_base64_decode(scr_get_custom_music())
    buffer_save(wait, "waiting_music.ogg")
}
frame_skip = 0
if (!file_exists("halt"))
    instance_deactivate_all(true)
if file_exists("halt")
{
    preset[0] = -1
    scr_load_presets()
}
current_savestate_slot = 0
