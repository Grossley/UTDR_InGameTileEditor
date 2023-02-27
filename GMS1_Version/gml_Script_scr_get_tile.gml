if tile_exists(persistentid)
{
    tilex_tl = tile_get_x(persistentid)
    tiley_tl = tile_get_y(persistentid)
    tilex_br = (tile_get_x(persistentid) + tile_get_width(persistentid))
    tiley_br = (tile_get_y(persistentid) + tile_get_height(persistentid))
    exit
}
tilex_tl = 0
tiley_tl = 0
tilex_br = 0
tiley_br = 0
if (tile_get_mode == 0)
    scr_get_tile_old()
if (tile_get_mode == 1)
    scr_get_lowest_depth_tile()
