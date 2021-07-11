if keyboard_check_pressed(vk_f2)
{
    if show_question("All editing history (aside from the current state) will be lost. Are you sure?")
    {
        directory_destroy((((safe_path + "/tempsaves/") + string(room)) + "/"))
        directory_create((((safe_path + "/tempsaves/") + string(room)) + "/"))
        current_temp_save_value = 0
        scr_temp_save(current_temp_save_value)
        scr_temp_load(current_temp_save_value)
    }
}
