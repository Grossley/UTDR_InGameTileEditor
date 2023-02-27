scr_get_tile()
scr_preview_tile()
scr_get_tile_text()
if (tile_exists(persistentid) && mouse_check_button(mb_left) && drag_null_lock == 0)
{
    persistent_visibility = tile_get_visible(persistentid)
    persistent_alpha = tile_get_alpha(persistentid)
    persistent_blend = tile_get_blend(persistentid)
    persistent_background = tile_get_background(persistentid)
    persistent_depth = tile_get_depth(persistentid)
    persistent_region_left = tile_get_left(persistentid)
    persistent_region_top = tile_get_top(persistentid)
    persistent_region_width = tile_get_width(persistentid)
    persistent_region_height = tile_get_height(persistentid)
    persistent_scale_x = tile_get_xscale(persistentid)
    persistent_scale_y = tile_get_yscale(persistentid)
    write_preset_background = persistent_background
    write_preset_left = persistent_region_left
    write_preset_top = persistent_region_top
    write_preset_width = persistent_region_width
    write_preset_height = persistent_region_height
    write_preset_xscale = persistent_scale_x
    write_preset_yscale = persistent_scale_y
    drag_null_lock = 1
}
if ((!mouse_check_button(mb_left)) && drag_null_lock == 1)
{
    scr_add_new_preset(write_preset_background, write_preset_left, write_preset_top, write_preset_width, write_preset_height, write_preset_xscale, write_preset_yscale)
    drag_null_lock = 0
}
if (!mouse_check_button(mb_left))
    persistentid = -1
