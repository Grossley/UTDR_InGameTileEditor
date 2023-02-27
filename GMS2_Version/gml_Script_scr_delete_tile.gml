scr_get_tile()
scr_preview_tile()
scr_get_tile_text()
if (tile_exists(persistentid) && mouse_check_button_pressed(mb_left) && del_tile_lock == 0)
{
    tile_delete(persistentid)
    persistentid = -1
    del_tile_lock = 1
}
if (!mouse_check_button(mb_left))
    persistentid = -1
if ((!mouse_check_button(mb_left)) && del_tile_lock == 1)
{
    scr_tile_savestate_manager(1)
    del_tile_lock = 0
}
