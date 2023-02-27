persistent_visibility = ""
persistent_alpha = ""
persistent_blend = ""
persistent_background = ""
persistent_depth = ""
persistent_region_left = ""
persistent_region_top = ""
persistent_region_width = ""
persistent_region_height = ""
persistent_scale_x = ""
persistent_scale_y = ""
if keyboard_check_pressed(vk_f2)
{
    if (use_user_defined == 1)
    {
        use_user_defined = (!show_question("Would you like to disable the tile transform tool?"))
        persist_values = (!show_question("Would you like to discard your tile transform settings? If you select NO you will be able to resume transforming tiles when you re-enable tile transform."))
        if (!persist_values)
        {
            if show_question("Would you like to save your settings as a tile preset?")
            {
                write_preset_background = persistent_background
                write_preset_left = persistent_region_left
                write_preset_top = persistent_region_top
                write_preset_width = persistent_region_width
                write_preset_height = persistent_region_height
                write_preset_xscale = persistent_scale_x
                write_preset_yscale = persistent_scale_y
                if (persistent_background == "")
                    write_preset_background = 0
                if (persistent_region_left == "")
                    write_preset_left = 0
                if (persistent_region_top == "")
                    write_preset_top = 0
                if (persistent_region_width == "")
                    write_preset_width = 20
                if (persistent_region_height == "")
                    write_preset_height = 20
                if (persistent_scale_x == "")
                    write_preset_xscale = 1
                if (persistent_scale_y == "")
                    write_preset_yscale = 1
                scr_add_new_preset(write_preset_background, write_preset_left, write_preset_top, write_preset_width, write_preset_height, write_preset_xscale, write_preset_yscale)
                show_message("Tile added successfully to presets.")
            }
        }
    }
    if (use_user_defined == 0)
        use_user_defined = show_question("Would you like to use the tile transform tool?")
}
if (use_user_defined && persist_values == 0)
{
    persist_values = 1
    if (!show_question("Select YES for copy tile under cursor, no for manual specification"))
    {
        if show_question("Would you like to set tile visibility?")
            persistent_visibility = get_integer("Set visibility (0 for false, 1 for true)", 0)
        if show_question("Would you like to set tile alpha?")
            persistent_alpha = real(get_string("Set tile alpha (any real value between 0 and 1)", "0"))
        if show_question("Would you like to set tile blend?")
        {
            persistent_blend = get_integer("Set tile blend (decimal color)", 0)
            if (persistent_blend > c_white)
                persistent_blend = c_white
            if (persistent_blend < c_black)
                persistent_blend = c_black
        }
        if show_question("Would you like to set tile background?")
            persistent_background = asset_get_index(get_string("Enter background name", "bg_coretiles_erase"))
        if show_question("Would you like to set tile depth?")
            persistent_depth = get_integer("Enter tile depth", 0)
        if show_question("Would you like to set tile region?")
        {
            persistent_region_left = get_integer("Tile Left", 0)
            persistent_region_top = get_integer("Tile Top", 0)
            persistent_region_width = get_integer("Tile Width", 0)
            persistent_region_height = get_integer("Tile Height", 0)
        }
        if show_question("Would you like to set tile scale?")
        {
            persistent_scale_x = get_integer("TILE X SCALE", 0)
            persistent_scale_y = get_integer("TILE Y SCALE", 0)
        }
    }
    else
    {
        persistent_visibility = tile_get_visible(persistentid)
        persistent_alpha = tile_get_alpha(persistentid)
        persistent_blend = tile_get_blend(persistentid)
        persistent_background = tile_get_depth(persistentid)
        persistent_depth = tile_get_depth(persistentid)
        persistent_region_left = tile_get_left(persistentid)
        persistent_region_top = tile_get_top(persistentid)
        persistent_region_width = tile_get_width(persistentid)
        persistent_region_height = tile_get_height(persistentid)
        persistent_scale_x = tile_get_xscale(persistentid)
        persistent_scale_y = tile_get_yscale(persistentid)
    }
    if show_question("Would you like to save this as a tile preset?")
    {
        write_preset_background = persistent_background
        write_preset_left = persistent_region_left
        write_preset_top = persistent_region_top
        write_preset_width = persistent_region_width
        write_preset_height = persistent_region_height
        write_preset_xscale = persistent_scale_x
        write_preset_yscale = persistent_scale_y
        if (persistent_background == "")
            write_preset_background = 0
        if (persistent_region_left == "")
            write_preset_left = 0
        if (persistent_region_top == "")
            write_preset_top = 0
        if (persistent_region_width == "")
            write_preset_width = 20
        if (persistent_region_height == "")
            write_preset_height = 20
        if (persistent_scale_x == "")
            write_preset_xscale = 1
        if (persistent_scale_y == "")
            write_preset_yscale = 1
        scr_add_new_preset(write_preset_background, write_preset_left, write_preset_top, write_preset_width, write_preset_height, write_preset_xscale, write_preset_yscale)
        show_message("Tile added successfully to presets.")
    }
}
if (use_user_defined && persist_values)
{
    if (persistent_visibility != "")
        tile_set_visible(persistentid, persistent_visibility)
    if (persistent_blend != "")
        tile_set_alpha(persistentid, persistent_blend)
    if (persistent_blend != "")
        tile_set_blend(persistentid, persistent_blend)
    if (persistent_background != "")
        tile_set_background(persistentid, persistent_background)
    if (persistent_depth != "")
        tile_set_depth(persistentid, persistent_depth)
    if (persistent_region_left != "" && persistent_region_top != "" && persistent_region_width != "" && persistent_region_height != "")
        tile_set_region(persistentid, persistent_region_left, persistent_region_top, persistent_region_width, persistent_region_height)
    if (persistent_scale_x != "" && persistent_scale_y != "")
        tile_set_scale(persistentid, persistent_scale_x, persistent_scale_y)
}
