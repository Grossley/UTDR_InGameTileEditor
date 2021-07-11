scr_get_tile()
scr_preview_tile()
scr_get_tile_text()
if (tile_exists(persistentid) && mouse_check_button_pressed(mb_left) && dup_lock == 0)
{
    old_background = tile_get_background(persistentid)
    old_left = tile_get_left(persistentid)
    old_top = tile_get_top(persistentid)
    old_width = tile_get_width(persistentid)
    old_height = tile_get_height(persistentid)
    old_mouse_x_pos = floor((mouse_x - (old_width / 2)))
    old_mouse_y_pos = floor((mouse_y - (old_height / 2)))
    old_depth = tile_get_depth(persistentid)
    old_alpha = tile_get_alpha(persistentid)
    old_blend = tile_get_blend(persistentid)
    old_visible = tile_get_visible(persistentid)
    persistentid = -1
    persistentid = tile_get_id(tile_add(old_background, old_left, old_top, old_width, old_height, old_mouse_x_pos, old_mouse_y_pos, old_depth))
    tile_set_alpha(persistentid, old_alpha)
    tile_set_blend(persistentid, old_blend)
    tile_set_visible(persistentid, old_visible)
    dup_lock = 1
}
if (tile_exists(persistentid) && mouse_check_button(mb_right))
{
    tile_set_position(persistentid, floor((mouse_x - (tile_get_width(persistentid) / 2))), floor((mouse_y - (tile_get_height(persistentid) / 2))))
    dup_lock = 1
}
if ((!mouse_check_button(mb_left)) && (!mouse_check_button(mb_right)))
    persistentid = -1
if ((!mouse_check_button(mb_left)) && (!mouse_check_button(mb_right)) && dup_lock == 1)
{
    scr_tile_savestate_manager(1)
    dup_lock = 0
}
