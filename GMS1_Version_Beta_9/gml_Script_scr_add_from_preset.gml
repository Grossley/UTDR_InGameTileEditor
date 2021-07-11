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
    reset_prev_tile = 0
}
if (preset[preset_index] != -1 && tile_exists(preview_tile))
{
    if (grid_toggle == 1)
    {
        pre_floor_a = floor(mouse_x)
        a = floor((pre_floor_a / tile_get_width(preview_tile)))
        new_tile_x_pos = floor((tile_get_width(preview_tile) * a))
        pre_floor_b = floor(mouse_y)
        b = floor((pre_floor_b / tile_get_height(preview_tile)))
        new_tile_y_pos = floor((tile_get_height(preview_tile) * b))
        tile_set_position(preview_tile, floor(new_tile_x_pos), floor(new_tile_y_pos))
    }
    else
        tile_set_position(preview_tile, floor((mouse_x - (tile_get_width(preview_tile) / 2))), floor((mouse_y - (tile_get_height(preview_tile) / 2))))
}
if keyboard_check_pressed(ord("P"))
{
    preview_tile_set = 0
    if tile_exists(preview_tile)
        tile_delete(preview_tile)
}
if keyboard_check_pressed(ord("6"))
{
    preview_tile_set = 0
    if tile_exists(preview_tile)
        tile_delete(preview_tile)
    if (grid_toggle == 1)
        grid_toggle = 0
    else
        grid_toggle = 1
}
if keyboard_check_pressed(ord("7"))
{
    preview_tile_set = 0
    if tile_exists(preview_tile)
        tile_delete(preview_tile)
    preset_index += 1
}
if keyboard_check_pressed(ord("8"))
{
    preview_tile_set = 0
    if tile_exists(preview_tile)
        tile_delete(preview_tile)
    preset_index -= 1
}
if keyboard_check_pressed(ord("9"))
{
    preview_tile_set = 0
    if tile_exists(preview_tile)
        tile_delete(preview_tile)
    preset_index = get_integer("Specify preset index", preset_number)
}
if keyboard_check_pressed(ord("0"))
{
    preview_tile_set = 0
    if tile_exists(preview_tile)
        tile_delete(preview_tile)
    user_defined_preset_depth = get_integer("Set tile depth", 0)
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
if (grid_toggle == 1)
{
    new_tile_x_pos = floor((preset_width[preset_index] * floor((mouse_x / preset_width[preset_index]))))
    new_tile_y_pos = floor((preset_height[preset_index] * floor((mouse_y / preset_height[preset_index]))))
    if (grid_tile_lock == 0)
    {
        if mouse_check_button(mb_left)
        {
            add_lock = 1
            preview_tile_set = 0
            if tile_exists(preview_tile)
                tile_delete(preview_tile)
            persistentid = tile_add(preset_background[preset_index], preset_left[preset_index], preset_top[preset_index], preset_width[preset_index], preset_height[preset_index], floor(new_tile_x_pos), floor(new_tile_y_pos), user_defined_preset_depth)
            tile_set_blend(persistentid, c_white)
            old_tile_x_pos = new_tile_x_pos
            old_tile_y_pos = new_tile_y_pos
            grid_tile_lock = 1
        }
    }
    if (old_tile_x_pos != new_tile_x_pos || old_tile_y_pos != new_tile_y_pos)
        grid_tile_lock = 0
}
if (grid_toggle == 0)
{
    if ((mouse_check_button(mb_left) || mouse_check_button(mb_right)) && background_exists(preset_background[preset_index]) && preset[preset_index] != -1)
    {
        add_lock = 1
        preview_tile_set = 0
        if tile_exists(preview_tile)
            tile_delete(preview_tile)
        if mouse_check_button_pressed(mb_left)
        {
            persistentid = tile_add(preset_background[preset_index], preset_left[preset_index], preset_top[preset_index], preset_width[preset_index], preset_height[preset_index], floor(mouse_x), floor(mouse_y), user_defined_preset_depth)
            tile_set_blend(persistentid, c_white)
        }
        if (persistentid != 0)
        {
            if (grid_toggle == 1)
            {
                new_tile_x_pos = floor((tile_get_width(persistentid) * floor(((mouse_x - (tile_get_width(persistentid) / 2)) / tile_get_width(persistentid)))))
                new_tile_y_pos = floor((tile_get_height(persistentid) * floor(((mouse_y - (tile_get_height(persistentid) / 2)) / tile_get_height(persistentid)))))
                tile_set_position(persistentid, new_tile_x_pos, new_tile_y_pos)
            }
            else
                tile_set_position(persistentid, floor((mouse_x - (tile_get_width(persistentid) / 2))), floor((mouse_y - (tile_get_height(persistentid) / 2))))
        }
    }
}
if ((!(mouse_check_button(mb_left) || mouse_check_button(mb_right))) && add_lock == 1)
{
    scr_tile_savestate_manager(1)
    reset_prev_tile = 1
    add_lock = 0
}
scr_get_tile_text()
