scr_force_size()
frame_skip += 1
if (!file_exists("halt"))
    exit
mode_changed = 0
if keyboard_check_pressed(ord("G"))
{
    turn_off_text_for_Shesez = (!turn_off_text_for_Shesez)
}
if keyboard_check_pressed(ord("1"))
{
    mode += 1
    mode_changed = 1
}
if keyboard_check_pressed(ord("2"))
{
    mode -= 1
    mode_changed = 1
}
if keyboard_check_pressed(ord("3"))
{
    mode += 5
    mode_changed = 1
}
if keyboard_check_pressed(ord("4"))
{
    mode -= 5
    mode_changed = 1
}
if keyboard_check_pressed(ord("M"))
{
    add_preset_from_tile_mode += 1
    if (add_preset_from_tile_mode > 2)
        add_preset_from_tile_mode = 0
    if (add_preset_from_tile_mode == 0)
        write_preset_file_loc = "lg"
    else if (add_preset_from_tile_mode == 1)
        write_preset_file_loc = "l"
    else if (add_preset_from_tile_mode == 2)
        write_preset_file_loc = "g"
    preview_tile_set = 0
    if tile_exists(preview_tile)
        tile_delete(preview_tile)
    scr_load_presets()
}
if keyboard_check_pressed(vk_f3)
    preview_tiles_enabled = (!preview_tiles_enabled)
if keyboard_check_pressed(vk_f12)
    mode = get_integer("Enter mode number", 0)
if (mode > max_modes)
    mode = 0
else if (mode < 0)
    mode = max_modes
if mode_changed
    preview_tile_set = 0
if ((mode != 2 && preview_tiles_enabled == 0) || mode == 5)
{
    if tile_exists(preview_tile)
        tile_delete(preview_tile)
    preview_tile_set = 0
}
scr_tile_savestate_manager()
if (mode == 1)
{
    current_mode = "Drag"
    scr_drag_tile()
}
else if (mode == 2)
{
    current_mode = "Add"
    scr_add_from_preset()
}
else if (mode == 3)
{
    current_mode = "Delete"
    scr_delete_tile()
}
else if (mode == 4)
{
    current_mode = "Duplicate"
    scr_duplicate_tile()
}
else if (mode == 5)
{
    current_mode = "Reset to Original Game Tile Layout (Permanent)"
    scr_reset_the_room()
}
else if (mode == 6)
{
    current_mode = "Freecam"
    scr_freecam()
}
else if (mode == 7)
{
    current_mode = "Save Custom Layout"
    scr_save_custom_layout()
}
else if (mode == 8)
{
    current_mode = "Add Preset from Tile"
    scr_add_preset_from_tile()
}
else if (mode == 9)
{
    current_mode = "Reset to Last Saved Custom Layout"
    scr_reset_to_cust_layout()
}
else if (mode == 10)
{
    current_mode = "Edit Existing Preset"
    scr_edit_existing_preset()
}
else if (mode == 11)
{
    current_mode = "FPS Toggle"
    scr_fps_toggle()
}
else if (mode == 12)
{
    current_mode = "Wipe all data (to pre-install state) and close game"
    scr_wipe_all_data()
}
else if (mode == 13)
{
    current_mode = "(Unimplemented)"
    scr_group_duplicate()
}
else if (mode == 14)
{
    current_mode = "Delete an entire layer at once (F5)"
    scr_layer_delete()
}
else if (mode == 15)
{
    current_mode = "Bulk Delete"
    scr_bulk_delete()
}
else if (mode == 16)
{
    current_mode = "Restart Game"
    scr_restart_game()
}
else if (mode == 17)
{
    current_mode = "Delete Pre-Existing Preset"
    scr_delete_preset()
}
else if (mode == 18)
{
    current_mode = "Clear Room Editing History"
    scr_clear_editing_history()
}
else if (mode == 19)
{
    current_mode = "Jump Rooms"
    scr_jump_rooms()
}
else if (mode == 20)
{
    current_mode = "Debug Toggle"
    scr_debug_toggle()
}
else if (mode == 21)
{
    current_mode = "Free/Unstick player"
    scr_unstick()
}
else if (mode == 22)
{
    current_mode = "Game Save/Load"
    scr_game_saveload()
}
else if (mode == 23)
{
    current_mode = "Save/Load a Game Savestate"
    scr_savestate_saveload()
}
else if (mode == 24)
{
    current_mode = "Stop all playing sounds using F2, adjust game volume using 9 and 0"
    scr_stopsounds()
}
else if (mode == 25)
{
    current_mode = "Invincibility in battle"
    scr_invincibility()
}
else if (mode == 26)
{
    current_mode = "No-clip (F10 to toggle)"
    scr_noclip()
}
else if (mode == 27)
{
    current_mode = "One Punch Man Mode (Instantly kill any enemy?????)"
    scr_onepunchman()
}
else if (mode == 28)
{
    current_mode = "Toggle Run (Backspace to run, F6 to toggle)"
    scr_runtoggle()
}
else if (mode == 29)
{
    current_mode = "Super Freecam (See documentation for instructions)"
    scr_superfreecam()
}
else if (mode == 30)
{
    current_mode = "Inspect Room Properties"
    scr_inspect_room()
}
else if (mode >= 31)
{
    current_mode = "(Unimplemented)"
    scr_placeholder()
}
mode_changed = 0
