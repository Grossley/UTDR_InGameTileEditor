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
