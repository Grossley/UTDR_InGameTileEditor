prefix = (game_project_name + "_NEW/")
if (file_exists(((prefix + string(room)) + ".txt")) && file_exists("halt"))
    scr_tile_load()
if (!file_exists("halt"))
    scr_tile_save()
if file_exists("halt")
    scr_load_presets()
if (!file_exists("halt"))
{
    instance_deactivate_all(true)
    if (asset_get_index("obj_screen") != -1)
        instance_activate_object(obj_screen)
}
if (asset_get_index("__view_set") != -1 && asset_get_index("__view_get") != -1)
{
    orig_hview = script_execute(asset_get_index("__view_get"), 3, 0)
    orig_wview = script_execute(asset_get_index("__view_get"), 2, 0)
}
else
{
    orig_hview = view_hview[0]
    orig_wview = view_wview[0]
}
orig_following = view_object[0]
existed_obj_mainchara = -1
existed_obj_mainchara_fake = -1
existed_obj_overworldc = -1
existed_obj_caterpillarchara = -1
