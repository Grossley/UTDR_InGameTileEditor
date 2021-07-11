tile_count = ""
c_tile_id = ""
bg_name = ""
c_tile_left = ""
c_tile_top = ""
c_width = ""
c_height = ""
c_xscale = ""
c_yscale = ""
c_tile_alpha = ""
c_tile_blend = ""
c_tile_visible = ""
c_tile_depth = ""
c_tile_x_pos = ""
c_tile_y_pos = ""
if tile_exists(persistentid)
{
    if (mode == 1 || mode == 3 || mode == 4)
    {
        if (tile_get_mode == 0)
        {
            if tile_exists(persistentid)
            {
                tile_count = ("Total number of tiles: " + string(array_length_1d(tiles)))
                bg_name = ("Background name: " + string(background_get_name(tile_get_background(persistentid))))
                c_tile_id = ("Currently selected tile: " + string(persistentid))
                c_tile_left = ("Tile Left: " + string(tile_get_left(persistentid)))
                c_tile_top = ("Tile Top: " + string(tile_get_top(persistentid)))
                c_width = ("Tile Width: " + string(tile_get_width(persistentid)))
                c_height = ("Tile Height: " + string(tile_get_height(persistentid)))
                c_xscale = ("Tile X SCALE: " + string(tile_get_xscale(persistentid)))
                c_yscale = ("Tile Y SCALE: " + string(tile_get_yscale(persistentid)))
                c_tile_alpha = ("Tile alpha: " + string(tile_get_alpha(persistentid)))
                c_tile_blend = ("Tile blend: " + string(tile_get_blend(persistentid)))
                c_tile_visible = ("Tile visible: " + string(tile_get_visible(persistentid)))
                c_tile_depth = ("Tile depth: " + string(tile_get_depth(persistentid)))
                c_tile_x_pos = ("Tile X Position: " + string(floor((mouse_x - (tile_get_width(persistentid) / 2)))))
                c_tile_y_pos = ("Tile Y Position: " + string(floor((mouse_y - (tile_get_height(persistentid) / 2)))))
            }
        }
        else if (tile_get_mode == 1)
        {
            tile_count = ("Total number of tiles under cursor: " + string(thetilecounter))
            bg_name = ("Background name: " + string(background_get_name(tile_get_background(persistentid))))
            c_tile_id = ("Currently selected tile: " + string(persistentid))
            c_tile_left = ("Tile Left: " + string(tile_get_left(persistentid)))
            c_tile_top = ("Tile Top: " + string(tile_get_top(persistentid)))
            c_width = ("Tile Width: " + string(tile_get_width(persistentid)))
            c_height = ("Tile Height: " + string(tile_get_height(persistentid)))
            c_xscale = ("Tile X SCALE: " + string(tile_get_xscale(persistentid)))
            c_yscale = ("Tile Y SCALE: " + string(tile_get_yscale(persistentid)))
            c_tile_alpha = ("Tile alpha: " + string(tile_get_alpha(persistentid)))
            c_tile_blend = ("Tile blend: " + string(tile_get_blend(persistentid)))
            c_tile_visible = ("Tile visible: " + string(tile_get_visible(persistentid)))
            c_tile_depth = ("Tile depth: " + string(tile_get_depth(persistentid)))
            c_tile_x_pos = ("Tile X Position: " + string(floor((mouse_x - (tile_get_width(persistentid) / 2)))))
            c_tile_y_pos = ("Tile Y Position: " + string(floor((mouse_y - (tile_get_height(persistentid) / 2)))))
        }
    }
}
else if (mode == 2)
{
    tile_count = ("Total number of presets: " + string(preset_number))
    bg_name = ("Background name: " + string(background_get_name(preset_background[preset_index])))
    c_tile_id = ("Currently selected preset: " + string(preset_index))
    c_tile_left = ("Tile Preset Left: " + string(preset_left[preset_index]))
    c_tile_top = ("Tile Preset Top: " + string(preset_top[preset_index]))
    c_width = ("Tile Preset Width: " + string(preset_width[preset_index]))
    c_height = ("Tile Preset Height: " + string(preset_height[preset_index]))
    c_xscale = ("Tile Preset X SCALE: " + string(preset_xscale[preset_index]))
    c_yscale = ("Tile Preset Y SCALE: " + string(preset_yscale[preset_index]))
    c_tile_depth = ("Tile Preset depth: " + string(user_defined_preset_depth))
    c_tile_x_pos = ("Tile Preset X Position: " + string(floor((mouse_x - (preset_width[preset_index] / 2)))))
    c_tile_y_pos = ("Tile Preset Y Position: " + string(floor((mouse_y - (preset_height[preset_index] / 2)))))
}
