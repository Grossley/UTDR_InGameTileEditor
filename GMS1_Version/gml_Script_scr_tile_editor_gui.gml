spacing = 16
if (mode >= 1 && mode <= max_modes)
{
    if (tile_get_mode == 0)
        tile_get_mode_str = "Old"
    else if (tile_get_mode == 1)
        tile_get_mode_str = "New"
    if (write_preset_file_loc == "lg")
        preset_scope = "Local + Global"
    if (write_preset_file_loc == "l")
        preset_scope = "Local"
    if (write_preset_file_loc == "g")
        preset_scope = "Global"
    if (turn_off_text_for_Shesez == false)
    {
        draw_set_colour(c_white)
        draw_set_font(font_to_use)
    }
    str_to_show = 0
    if (mode == 30)
    {
        str_to_show = 0
        str_to_show = array_create(23)
        scr_inspect_room()
    }
    else
    {
        str_to_show = 0
        str_to_show = array_create(19)
        str_to_show[0] = (((("Current room: " + room_get_name(room)) + " (") + string(room)) + ")")
        str_to_show[1] = (((("Current mode: " + string(current_mode)) + " (") + string(mode)) + ")")
        str_to_show[2] = ("Current preset scope: " + preset_scope)
        str_to_show[3] = (((("Current tile get mode: " + string(tile_get_mode_str)) + " (") + string(tile_get_mode)) + ")")
        str_to_show[4] = ("Total number of tiles: " + string(array_length_1d(tiles)))
        str_to_show[5] = tile_count
        str_to_show[6] = c_tile_id
        str_to_show[7] = bg_name
        str_to_show[8] = c_tile_left
        str_to_show[9] = c_tile_top
        str_to_show[10] = c_width
        str_to_show[11] = c_height
        str_to_show[12] = c_xscale
        str_to_show[13] = c_yscale
        str_to_show[14] = c_tile_alpha
        str_to_show[15] = c_tile_blend
        str_to_show[16] = c_tile_visible
        str_to_show[17] = c_tile_depth
        str_to_show[18] = c_tile_x_pos
        str_to_show[19] = c_tile_y_pos
    }
    for (line_count = 0; line_count < array_length_1d(str_to_show); line_count++)
    {
        x_pos_tl = x
        y_pos_tl = (y + (line_count * spacing))
        x_pos_br = (x_pos_tl + string_width(str_to_show[line_count]))
        y_pos_br = (y_pos_tl + string_height(str_to_show[line_count]))
        if (turn_off_text_for_Shesez == false)
        {
            draw_rectangle_colour(x_pos_tl, y_pos_tl, x_pos_br, y_pos_br, c_black, c_black, c_black, c_black, 0)
            draw_text(x_pos_tl, y_pos_tl, string_hash_to_newline(str_to_show[line_count]))
        }
    }
}
else
{
    current_mode = "None (Default mode)"
    if (turn_off_text_for_Shesez == false)
    {
        draw_set_colour(c_white)
        draw_set_font(font_to_use)
        draw_text(x, y, string_hash_to_newline((((("Current room: " + room_get_name(room)) + " (") + string(room)) + ")")))
    }
}
