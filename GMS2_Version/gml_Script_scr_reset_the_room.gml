if keyboard_check_pressed(vk_f2)
{
    if show_question("This will reset the room back to its original state. Are you sure?")
    {
        directory_create("DELETED_NEW")
        file_copy((((game_project_name + "_NEW/") + string(room)) + ".txt"), (("DELETED_NEW/" + string(room)) + ".txt"))
        if file_exists((((game_project_name + "_NEW/") + string(room)) + ".txt"))
            file_delete((((game_project_name + "_NEW/") + string(room)) + ".txt"))
        file_copy((((game_project_name + "_ORIG/") + string(room)) + ".txt"), (((game_project_name + "_NEW/") + string(room)) + ".txt"))
        tiles = tile_get_ids()
        for (i = 0; i < array_length_1d(tiles); i++)
            tile_delete(tiles[i])
        scr_tile_load()
        scr_tile_savestate_manager(1)
    }
}
