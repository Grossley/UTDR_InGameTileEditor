tiles = 0
tbv = "0"
tile_background = real(tbv)
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
tilesUnderCursor = 0
tiles = tile_get_ids()
minDepth = 0
thetilecounter = 0
minDepthSet = 0
tilesUnderCursor[0] = 0
isTrrigered = 0
tile_count = array_length_1d(tiles)
if (tile_count > 0)
{
    for (i = 0; i < tile_count; i++)
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
        tilex_tl = tile_get_x(tiles[i])
        tiley_tl = tile_get_y(tiles[i])
        tilex_br = (tile_get_x(tiles[i]) + tile_get_width(tiles[i]))
        tiley_br = (tile_get_y(tiles[i]) + tile_get_height(tiles[i]))
        isPreviewTile = 1
        if tile_exists(preview_tile)
        {
            if (tiles[i] != preview_tile)
                isPreviewTile = 0
        }
        else
            isPreviewTile = 0
        isEligible = 0
        if (background_exists(tile_background[i]) && isPreviewTile == 0)
            isEligible = 1
        if (mouse_x >= tilex_tl && mouse_x <= tilex_br && mouse_y <= tiley_br && mouse_y >= tiley_tl && isEligible == 1)
        {
            draw_set_colour(c_yellow)
            draw_rectangle(tilex_tl, tiley_tl, tilex_br, tiley_br, 1)
            tilesUnderCursor[thetilecounter] = tiles[i]
            thetilecounter += 1
        }
    }
    min_depth_value = 999999999
    for (i = 0; i < (array_length_1d(tilesUnderCursor) - 1); i++)
    {
        value_a = tile_get_depth(tilesUnderCursor[i])
        value_b = tile_get_depth(tilesUnderCursor[(i + 1)])
        if (value_a < value_b && value_a < min_depth_value)
        {
            isTrrigered = 1
            minDepth = tilesUnderCursor[i]
            min_depth_value = value_a
            minDepthSet = 1
        }
        else if (value_b < value_a && value_b < min_depth_value)
        {
            isTrrigered = 1
            minDepth = tilesUnderCursor[(i + 1)]
            min_depth_value = value_b
            minDepthSet = 1
        }
        else if (value_b == value_a && value_b < min_depth_value)
        {
            isTrrigered = 1
            minDepth = tilesUnderCursor[(i + 1)]
            min_depth_value = value_b
            minDepthSet = 1
        }
    }
    if (array_length_1d(tilesUnderCursor) == 1)
    {
        isTrrigered = 1
        minDepth = tilesUnderCursor[0]
        minDepthSet = 1
    }
    if (minDepthSet == 0)
        persistentid = -1
    else
        persistentid = minDepth
}
else
{
    persistentid = -1
    thetilecounter = 0
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
