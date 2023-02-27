scr_force_size()
frame_skip += 1
if (!file_exists("halt"))
    exit
max_modes = 30
mode_changed = 0
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
    if keyboard_check_pressed(vk_f2)
    {
        if (room_speed == 30)
            room_speed = 60
        else if (room_speed == 60)
            room_speed = 30
        else
            room_speed = 30
    }
}
else if (mode == 12)
{
    current_mode = "Wipe all data (to pre-install state) and close game"
    if keyboard_check_pressed(vk_f2)
    {
        if show_question("Are you sure? The game state will be reset to the state before install. This will destroy all of your custom data!")
        {
            if file_exists("destroyed")
            {
                for (i = 0; i <= 10; i++)
                {
                    savestate_filename = ("savestate" + string(i))
                    if file_exists(savestate_filename)
                        file_delete(savestate_filename)
                }
                if file_exists("go")
                    file_delete("go")
                if file_exists("halt")
                    file_delete("halt")
                if file_exists("waiting_music.ogg")
                    file_delete("waiting_music.ogg")
                if directory_exists(game_project_name + "_NEW")
                    directory_destroy(game_project_name + "_NEW")
                if directory_exists("DELETED_NEW")
                    directory_destroy("DELETED_NEW")
                if directory_exists(game_project_name + "_ORIG")
                    directory_destroy(game_project_name + "_ORIG")
                if directory_exists("presets")
                    directory_destroy("presets")
                if directory_exists("TEMP")
                    directory_destroy("TEMP")
                if directory_exists("tempsaves")
                    directory_destroy("tempsaves")
                show_message("All custom data destroyed. The game will now close.")
                game_end()
            }
            else if show_question("This is your last chance, do not blame me if this somehow happened on accident! Click YES to wipe all data.")
            {
                for (i = 0; i <= 10; i++)
                {
                    savestate_filename = ("savestate" + string(i))
                    if file_exists(savestate_filename)
                        file_delete(savestate_filename)
                }
                if file_exists("go")
                    file_rename("go", "destroyed")
                if file_exists("halt")
                    file_delete("halt")
                if file_exists("waiting_music.ogg")
                    file_delete("waiting_music.ogg")
                if directory_exists("DELETED_NEW")
                    directory_destroy("DELETED_NEW")
                if directory_exists(game_project_name + "_NEW")
                    directory_destroy(game_project_name + "_NEW")
                if directory_exists(game_project_name + "_ORIG")
                    directory_destroy(game_project_name + "_ORIG")
                if directory_exists("presets")
                    directory_destroy("presets")
                if directory_exists("TEMP")
                    directory_destroy("TEMP")
                if directory_exists("tempsaves")
                    directory_destroy("tempsaves")
                show_message("All custom data destroyed. The game will now close.")
                game_end()
            }
        }
    }
}
else if (mode == 13)
{
    current_mode = "(Unimplemented)"
    scr_group_duplicate()
}
else if (mode == 14)
{
    current_mode = "(Unimplemented)"
    scr_group_delete()
}
else if (mode == 15)
{
    current_mode = "Bulk Delete"
    scr_bulk_delete()
}
else if (mode == 16)
{
    current_mode = "Restart Game"
    if keyboard_check_pressed(vk_return)
        game_restart()
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
    if keyboard_check_pressed(vk_up)
        room_goto_next()
    else if keyboard_check_pressed(vk_down)
        room_goto_previous()
    else if keyboard_check_pressed(vk_f2)
        room_goto(get_integer("Enter room number", room))
}
else if (mode == 20)
{
    current_mode = "Debug Toggle"
    if keyboard_check_pressed(vk_f2)
    {
        if (global.debug == 0)
        {
            if show_question("Debug mode may interfere with the usage of this tool. If you are OK with this and understand the potential key conflicts, select YES. Otherwise, select NO to abort the debug toggle.")
            {
                show_message("Debug mode has been enabled. If you wish to use debug mode standalone with minimal interference, please switch to mode 13.")
                global.debug = 1
            }
        }
        else
        {
            global.debug = 0
            show_message("Debug mode has been disabled.")
        }
    }
}
else if (mode == 21)
{
    current_mode = "Free/Unstick player"
    if keyboard_check_pressed(vk_f2)
        global.interact = 0
}
else if (mode == 22)
{
    current_mode = "Game Save/Load"
    if keyboard_check_pressed(ord("S"))
        scr_save()
    if keyboard_check_pressed(ord("L"))
        scr_load()
}
else if (mode == 23)
{
    current_mode = "Save/Load a Game Savestate"
    tile_count = ("Currently Selected Savestate Slot: " + string(current_savestate_slot))
    if keyboard_check_pressed(ord("Q"))
    {
        current_savestate_slot += 1
        if (current_savestate_slot > 10)
            current_savestate_slot = 0
    }
    savestate_filename = ("savestate" + string(current_savestate_slot))
    if keyboard_check_pressed(ord("S"))
    {
        if show_question("Changes to the data.win file will likely result in the savestate data becoming invalid. If you try to load invalid savestate the game will crash. If a savestate is invalid, please overwrite or delete it. If you understand this and wish to proceed, select YES.")
            game_save(savestate_filename)
    }
    if keyboard_check_pressed(ord("0"))
    {
        if file_exists(savestate_filename)
        {
            if show_question("Would you like to delete the current savestate?")
                file_delete(savestate_filename)
        }
        else
            show_message("No savestate data to delete!")
    }
    if keyboard_check_pressed(ord("L"))
    {
        if file_exists(savestate_filename)
            game_load(savestate_filename)
        else
            show_message("No savestate data to load!")
    }
}
else if (mode == 24)
{
    current_mode = "Stop all playing sounds using F2, adjust game volume using 9 and 0"
    if keyboard_check_pressed(vk_f2)
        audio_stop_all()
    current_volume = audio_get_master_gain(0)
    if keyboard_check(ord("9"))
        audio_master_gain((current_volume + 0.01))
    if keyboard_check(ord("0"))
        audio_master_gain((current_volume - 0.01))
}
else if (mode >= 25)
{
    current_mode = "(Unimplemented)"
    scr_placeholder()
}
mode_changed = 0
