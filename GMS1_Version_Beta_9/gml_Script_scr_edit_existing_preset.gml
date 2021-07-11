preset_number = 0
i = 0
while (i < array_length_1d(preset))
{
    preset_number = (i + 1)
    if (preset[i] == -1)
        break
    else
    {
        i++
        continue
    }
}
if (preset_index < 0)
{
    if (preset_number >= 1)
        preset_index = (preset_number - 1)
    else
        preset_index = 0
}
if (preset_index >= preset_number)
    preset_index = 0
if (preset[preset_index] == -1)
    preset_index = 0
if (preset[preset_index] != -1 && preview_tile_set == 0 && (!(mouse_check_button(mb_left) || mouse_check_button(mb_right))) && background_exists(preset_background[preset_index]))
{
    preview_tile = tile_add(preset_background[preset_index], preset_left[preset_index], preset_top[preset_index], preset_width[preset_index], preset_height[preset_index], floor(mouse_x), floor(mouse_y), user_defined_preset_depth)
    tile_set_blend(preview_tile, c_white)
    preview_tile_set = 1
}
if (preset[preset_index] != -1 && tile_exists(preview_tile))
    tile_set_position(preview_tile, floor((mouse_x - (tile_get_width(preview_tile) / 2))), floor((mouse_y - (tile_get_height(preview_tile) / 2))))
if (keyboard_check_pressed(ord("P")) || keyboard_check_pressed(ord("7")) || keyboard_check_pressed(ord("8")) || keyboard_check_pressed(ord("9")))
{
    preview_tile_set = 0
    if tile_exists(preview_tile)
        tile_delete(preview_tile)
    if keyboard_check_pressed(ord("7"))
        preset_index += 1
    if keyboard_check_pressed(ord("8"))
        preset_index -= 1
    if keyboard_check_pressed(ord("9"))
        preset_index = get_integer("Specify preset index", preset_number)
}
if keyboard_check_pressed(vk_f2)
{
    if (preset_number <= 0)
        show_message("Nothing to edit!")
    else if show_question("This preset will be overwritten. Do not close the game during this process or data will be lost. Are you sure you want to continue? This cannot be undone!")
    {
        hold_background = preset_background[preset_index]
        hold_left = preset_left[preset_index]
        hold_top = preset_top[preset_index]
        hold_width = preset_width[preset_index]
        hold_height = preset_height[preset_index]
        hold_xscale = preset_xscale[preset_index]
        hold_yscale = preset_yscale[preset_index]
        scr_remove_one_preset()
        for (persistent_background = -1; persistent_background == -1; persistent_background = asset_get_index(get_string("Enter background name (not ID)", background_get_name(hold_background))))
        {
        }
        persistent_region_left = get_integer("Tile Left", hold_left)
        persistent_region_top = get_integer("Tile Top", hold_top)
        persistent_region_width = get_integer("Tile Width", hold_width)
        persistent_region_height = get_integer("Tile Height", hold_height)
        persistent_scale_x = get_integer("TILE X SCALE", hold_xscale)
        persistent_scale_y = get_integer("TILE Y SCALE", hold_yscale)
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
        show_message("Preset edited successfully.")
        scr_load_presets()
    }
}
scr_get_tile_text()
