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
