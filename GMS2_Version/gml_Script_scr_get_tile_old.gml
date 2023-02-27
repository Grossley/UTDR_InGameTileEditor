tiles = 0
tile_background = 0
tile_left = 0
tile_top = 0
tile_width = 0
tile_height = 0
tile_x = 0
tile_y = 0
tile_depth = 0
tile_xscale = 0
tile_yscale = 0
tile_alpha = 0
tile_blend = 0
tile_visible = 0
tiles = tile_get_ids()
for (i = 0; i < array_length_1d(tiles); i++)
{
    tile_background[i] = tile_get_background(tiles[i])
    tile_left[i] = tile_get_left(tiles[i])
    tile_top[i] = tile_get_top(tiles[i])
    tile_width[i] = tile_get_width(tiles[i])
    tile_height[i] = tile_get_height(tiles[i])
    tile_x[i] = tile_get_x(tiles[i])
    tile_y[i] = tile_get_y(tiles[i])
    tile_depth[i] = tile_get_depth(tiles[i])
    tile_xscale[i] = tile_get_xscale(tiles[i])
    tile_yscale[i] = tile_get_yscale(tiles[i])
    tile_alpha[i] = tile_get_alpha(tiles[i])
    tile_blend[i] = tile_get_blend(tiles[i])
    tile_visible[i] = tile_get_visible(tiles[i])
}
for (i = 0; i < array_length_1d(tiles); i++)
{
    tilex_tl = tile_get_x(tiles[i])
    tiley_tl = tile_get_y(tiles[i])
    tilex_br = (tile_get_x(tiles[i]) + tile_get_width(tiles[i]))
    tiley_br = (tile_get_y(tiles[i]) + tile_get_height(tiles[i]))
    if (mouse_x >= tilex_tl && mouse_x <= tilex_br && mouse_y <= tiley_br && mouse_y >= tiley_tl)
    {
        if (!tile_exists(persistentid))
            persistentid = tiles[i]
    }
}
if tile_exists(persistentid)
{
    tilex_tl = tile_get_x(persistentid)
    tiley_tl = tile_get_y(persistentid)
    tilex_br = (tile_get_x(persistentid) + tile_get_width(persistentid))
    tiley_br = (tile_get_y(persistentid) + tile_get_height(persistentid))
}
else
{
    tilex_tl = 0
    tiley_tl = 0
    tilex_br = 0
    tiley_br = 0
}
