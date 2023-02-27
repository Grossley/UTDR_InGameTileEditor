if keyboard_check_pressed(vk_f5)
{
    if (delete_layer_enabled == 0)
    {
        if show_question("Warning: this can be very destructive. Please only use this if you know what you're doing. Are you sure you want to continue?")
            delete_layer_enabled = 1
    }
    else if (delete_layer_enabled == 1)
        delete_layer_enabled = 0
}
if (delete_layer_enabled == 1)
{
    scr_get_tile()
    scr_preview_tile()
    scr_get_tile_text()
    if (tile_exists(persistentid) && mouse_check_button_pressed(mb_left) && del_tile_lock == 0)
    {
        tile_layer_delete(tile_get_depth(persistentid))
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
}
