if keyboard_check_pressed(vk_f2)
{
    if show_question("Overwrite your last saved custom layout?")
    {
        if tile_exists(preview_tile)
            tile_delete(preview_tile)
        scr_tile_save()
        scr_tile_load()
        preview_tile_set = 0
    }
}
