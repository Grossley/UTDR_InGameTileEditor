if keyboard_check_pressed(vk_f2)
{
    if show_question("This will reset the room back to the last custom layout that you saved. All editing history since then will be lost. Are you sure?")
    {
        if file_exists((((game_project_name + "_NEW/") + string(room)) + ".txt"))
        {
            directory_destroy((((safe_path + "/tempsaves/") + string(room)) + "/"))
            directory_create((((safe_path + "/tempsaves/") + string(room)) + "/"))
            file_copy((((game_project_name + "_NEW/") + string(room)) + ".txt"), ((((safe_path + "/tempsaves/") + string(room)) + "/") + "0.txt"))
            current_temp_save_value = 0
            scr_temp_load(current_temp_save_value)
        }
        else
        {
            file_copy((((game_project_name + "_ORIG/") + string(room)) + ".txt"), (((game_project_name + "_NEW/") + string(room)) + ".txt"))
            directory_destroy((((safe_path + "/tempsaves/") + string(room)) + "/"))
            directory_create((((safe_path + "/tempsaves/") + string(room)) + "/"))
            file_copy((((game_project_name + "_NEW/") + string(room)) + ".txt"), ((((safe_path + "/tempsaves/") + string(room)) + "/") + "0.txt"))
            current_temp_save_value = 0
            scr_temp_load(current_temp_save_value)
        }
    }
}
