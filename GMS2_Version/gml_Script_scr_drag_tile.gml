scr_get_tile()
scr_preview_tile()
scr_get_tile_text()
if (tile_exists(persistentid) && mouse_check_button(mb_left))
{
    tile_set_position(persistentid, floor((mouse_x - (tile_get_width(persistentid) / 2))), floor((mouse_y - (tile_get_height(persistentid) / 2))))
    scr_tile_transform()
    drag_null_lock = 1
}
if (!mouse_check_button(mb_left))
    persistentid = -1
if ((!mouse_check_button(mb_left)) && drag_null_lock == 1)
{
    scr_tile_savestate_manager(1)
    drag_null_lock = 0
}
