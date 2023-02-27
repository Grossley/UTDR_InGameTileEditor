directory_create((game_project_name + "_ORIG"))
directory_create((game_project_name + "_NEW"))
prefix = (game_project_name + "_ORIG/")
if file_exists(((prefix + string(room)) + ".txt"))
    prefix = (game_project_name + "_NEW/")
tiles = tile_get_ids()
file = ((prefix + string(room)) + ".txt")
myfileid = file_text_open_write(file)
file_text_write_string(myfileid, "a")
file_text_close(myfileid)
safe_file_name = (filename_path(file) + file)
myfileid = file_text_open_write(file)
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
for (i = 0; i < array_length_1d(tiles); i++)
{
    tile_background[i] = tile_get_background(tiles[i])
    tile_left[i] = tile_get_left(tiles[i])
    tile_top[i] = tile_get_top(tiles[i])
    tile_width[i] = tile_get_width(tiles[i])
    tile_height[i] = tile_get_height(tiles[i])
    tile_x[i] = floor(tile_get_x(tiles[i]))
    tile_y[i] = floor(tile_get_y(tiles[i]))
    tile_depth[i] = tile_get_depth(tiles[i])
    tile_xscale[i] = tile_get_xscale(tiles[i])
    tile_yscale[i] = tile_get_yscale(tiles[i])
    tile_alpha[i] = tile_get_alpha(tiles[i])
    tile_blend[i] = tile_get_blend(tiles[i])
    tile_visible[i] = tile_get_visible(tiles[i])
    if (tile_background[i] != -1)
    {
        file_text_write_string(myfileid, ("Tile index " + string(tiles[i])))
        file_text_writeln(myfileid)
        file_text_write_string(myfileid, string(tile_background[i]))
        file_text_writeln(myfileid)
        file_text_write_string(myfileid, string(tile_left[i]))
        file_text_writeln(myfileid)
        file_text_write_string(myfileid, string(tile_top[i]))
        file_text_writeln(myfileid)
        file_text_write_string(myfileid, string(tile_width[i]))
        file_text_writeln(myfileid)
        file_text_write_string(myfileid, string(tile_height[i]))
        file_text_writeln(myfileid)
        file_text_write_string(myfileid, string(tile_x[i]))
        file_text_writeln(myfileid)
        file_text_write_string(myfileid, string(tile_y[i]))
        file_text_writeln(myfileid)
        file_text_write_string(myfileid, string(tile_depth[i]))
        file_text_writeln(myfileid)
        file_text_write_string(myfileid, string(tile_xscale[i]))
        file_text_writeln(myfileid)
        file_text_write_string(myfileid, string(tile_yscale[i]))
        file_text_writeln(myfileid)
        file_text_write_string(myfileid, string(tile_alpha[i]))
        file_text_writeln(myfileid)
        file_text_write_string(myfileid, string(tile_blend[i]))
        file_text_writeln(myfileid)
        file_text_write_string(myfileid, string(tile_visible[i]))
        file_text_writeln(myfileid)
    }
}
file_text_close(myfileid)
