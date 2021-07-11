if 1
    exit
tiles = tile_get_ids()
directory_create("presets_rough")
file = (("presets_rough/" + string(room)) + ".txt")
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
tile_xscale = 0
tile_yscale = 0
for (i = 0; i < array_length_1d(tiles); i++)
{
    skip = 0
    tile_background[i] = tile_get_background(tiles[i])
    tile_left[i] = tile_get_left(tiles[i])
    tile_top[i] = tile_get_top(tiles[i])
    tile_width[i] = tile_get_width(tiles[i])
    tile_height[i] = tile_get_height(tiles[i])
    tile_xscale[i] = tile_get_xscale(tiles[i])
    tile_yscale[i] = tile_get_yscale(tiles[i])
}
for (i = 0; i < (array_length_1d(tiles) - 1); i += 2)
{
    if (!(tile_background[i] == tile_background[(i + 1)] && tile_left[i] == tile_left[(i + 1)] && tile_top[i] == tile_top[(i + 1)] && tile_width[i] == tile_width[(i + 1)] && tile_height[i] == tile_height[(i + 1)] && tile_xscale[i] == tile_xscale[(i + 1)] && tile_yscale[i] == tile_yscale[(i + 1)]))
    {
        if (tile_background[i] != -1)
        {
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
            file_text_write_string(myfileid, string(tile_xscale[i]))
            file_text_writeln(myfileid)
            file_text_write_string(myfileid, string(tile_yscale[i]))
            file_text_writeln(myfileid)
        }
        if (tile_background[(i + 1)] != -1)
        {
            file_text_write_string(myfileid, string(tile_background[(i + 1)]))
            file_text_writeln(myfileid)
            file_text_write_string(myfileid, string(tile_left[(i + 1)]))
            file_text_writeln(myfileid)
            file_text_write_string(myfileid, string(tile_top[(i + 1)]))
            file_text_writeln(myfileid)
            file_text_write_string(myfileid, string(tile_width[(i + 1)]))
            file_text_writeln(myfileid)
            file_text_write_string(myfileid, string(tile_height[(i + 1)]))
            file_text_writeln(myfileid)
            file_text_write_string(myfileid, string(tile_xscale[(i + 1)]))
            file_text_writeln(myfileid)
            file_text_write_string(myfileid, string(tile_yscale[(i + 1)]))
            file_text_writeln(myfileid)
        }
    }
}
file_text_close(myfileid)
