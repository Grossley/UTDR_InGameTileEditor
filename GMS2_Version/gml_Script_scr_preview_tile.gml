if (preview_tiles_enabled == 0)
    exit
if 1
    exit
if (!tile_exists(persistentid))
    exit
preview_tile_depth = (tile_get_depth(persistentid) - 1000000)
if (preview_tile_set == 0 && (!(mouse_check_button(mb_left) || mouse_check_button(mb_right))))
{
    preview_tile = tile_add(tile_get_background(persistentid), tile_get_left(persistentid), tile_get_top(persistentid), tile_get_width(persistentid), tile_get_height(persistentid), floor(mouse_x), floor(mouse_y), preview_tile_depth)
    tile_set_blend(preview_tile, c_white)
    preview_tile_set = 1
}
if tile_exists(preview_tile)
{
    a = floor((floor(mouse_x) / tile_get_width(preview_tile)))
    new_tile_x_pos = floor((tile_get_width(preview_tile) * a))
    b = floor((floor(mouse_y) / tile_get_height(preview_tile)))
    new_tile_y_pos = floor((tile_get_height(preview_tile) * b))
    tile_set_position(preview_tile, floor(new_tile_x_pos), floor(new_tile_y_pos))
    tilex_tl = tile_get_x(preview_tile)
    tiley_tl = tile_get_y(preview_tile)
    tilex_br = (tile_get_x(preview_tile) + tile_get_width(preview_tile))
    tiley_br = (tile_get_y(preview_tile) + tile_get_height(preview_tile))
}
new_tile_x_pos = floor((tile_get_width(preview_tile) * floor((mouse_x / tile_get_width(preview_tile)))))
new_tile_y_pos = floor((tile_get_height(preview_tile) * floor((mouse_y / tile_get_height(preview_tile)))))
if (grid_tile_lock == 0)
{
    preview_tile_set = 0
    if tile_exists(preview_tile)
        tile_delete(preview_tile)
    old_tile_x_pos = new_tile_x_pos
    old_tile_y_pos = new_tile_y_pos
    grid_tile_lock = 1
}
if (old_tile_x_pos != new_tile_x_pos || old_tile_y_pos != new_tile_y_pos)
{
    grid_tile_lock = 0
    preview_tile_set = 0
    if tile_exists(preview_tile)
        tile_delete(preview_tile)
}
if ((mouse_check_button(mb_left) || mouse_check_button(mb_right)) && background_exists(tile_get_background(persistentid)))
{
    preview_tile_set = 0
    if tile_exists(preview_tile)
        tile_delete(preview_tile)
}
