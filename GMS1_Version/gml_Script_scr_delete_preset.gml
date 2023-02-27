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
        show_message("Nothing to delete")
    else if show_question("Are you sure you'd like to delete this preset? This cannot be undone!")
    {
        scr_remove_one_preset()
        scr_load_presets()
    }
}
scr_get_tile_text()
