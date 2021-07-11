tiles_orig = 0
tiles_orig = tile_get_ids()
prefix = (game_project_name + "_NEW/")
if (!file_exists(((prefix + string(room)) + ".txt")))
    prefix = (game_project_name + "_ORIG/")
if (!file_exists(((prefix + string(room)) + ".txt")))
    show_error("Load of tile data failed! Neither ORIG or NEW data exists!", 1)
file = ((prefix + string(room)) + ".txt")
safe_file_name = (filename_path(file) + file)
myfileid = file_text_open_read(file)
i = 0
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
tile_blend = c_black
tile_visible = 0
while (!file_text_eof(myfileid))
{
    tiles[i] = real(string_digits(file_text_read_string(myfileid)))
    file_text_readln(myfileid)
    tile_background[i] = real(file_text_read_string(myfileid))
    file_text_readln(myfileid)
    tile_left[i] = real(file_text_read_string(myfileid))
    file_text_readln(myfileid)
    tile_top[i] = real(file_text_read_string(myfileid))
    file_text_readln(myfileid)
    tile_width[i] = real(file_text_read_string(myfileid))
    file_text_readln(myfileid)
    tile_height[i] = real(file_text_read_string(myfileid))
    file_text_readln(myfileid)
    tile_x[i] = floor(real(file_text_read_string(myfileid)))
    file_text_readln(myfileid)
    tile_y[i] = floor(real(file_text_read_string(myfileid)))
    file_text_readln(myfileid)
    tile_depth[i] = real(file_text_read_string(myfileid))
    file_text_readln(myfileid)
    tile_xscale[i] = real(file_text_read_string(myfileid))
    file_text_readln(myfileid)
    tile_yscale[i] = real(file_text_read_string(myfileid))
    file_text_readln(myfileid)
    tile_alpha[i] = real(file_text_read_string(myfileid))
    file_text_readln(myfileid)
    tile_blend[i] = real(file_text_read_string(myfileid))
    file_text_readln(myfileid)
    tile_visible[i] = real(file_text_read_string(myfileid))
    file_text_readln(myfileid)
    if (!tile_exists(tiles[i]))
        tiles[i] = tile_add(tile_background[i], tile_left[i], tile_top[i], tile_width[i], tile_height[i], tile_x[i], tile_y[i], tile_depth[i])
    tile_set_background(tiles[i], tile_background[i])
    tile_set_visible(tiles[i], tile_visible[i])
    tile_set_alpha(tiles[i], tile_alpha[i])
    tile_set_blend(tiles[i], tile_blend[i])
    tile_set_depth(tiles[i], tile_depth[i])
    tile_set_region(tiles[i], tile_left[i], tile_top[i], tile_width[i], tile_height[i])
    tile_set_scale(tiles[i], tile_xscale[i], tile_yscale[i])
    tile_set_position(tiles[i], tile_x[i], tile_y[i])
    i++
}
for (i = 0; i < array_length_1d(tiles_orig); i++)
{
    match = 0
    j = 0
    while (j < array_length_1d(tiles))
    {
        if (tiles_orig[i] == tiles[j])
        {
            match = 1
            break
        }
        else
        {
            j++
            continue
        }
    }
    if (match == 0)
        tile_delete(tiles_orig[i])
}
file_text_close(myfileid)
