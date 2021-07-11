if keyboard_check_pressed(ord("F"))
{
    if (freecam == 1)
    {
        if (asset_get_index("obj_marker") != -1)
        {
            if instance_exists(asset_get_index("obj_marker"))
                instance_destroy(asset_get_index("obj_marker"))
        }
        if (asset_get_index("obj_npc_marker") != -1)
        {
            if instance_exists(asset_get_index("obj_npc_marker"))
                instance_destroy(asset_get_index("obj_npc_marker"))
        }
        instance_activate_all()
        if (asset_get_index("__view_set") != -1 && asset_get_index("__view_get") != -1)
        {
            script_execute(asset_get_index("__view_set"), 3, 0, orig_hview)
            script_execute(asset_get_index("__view_set"), 2, 0, orig_wview)
            script_execute(asset_get_index("__view_set"), 0, 0, orig_xview)
            script_execute(asset_get_index("__view_set"), 1, 0, orig_yview)
        }
        else
        {
            view_hview[0] = orig_hview
            view_wview[0] = orig_wview
            view_xview[0] = orig_xview
            view_yview[0] = orig_yview
        }
        freecam = 0
    }
    else
    {
        if (asset_get_index("__view_set") != -1 && asset_get_index("__view_get") != -1)
        {
            orig_xview = script_execute(asset_get_index("__view_get"), 0, 0)
            orig_yview = script_execute(asset_get_index("__view_get"), 1, 0)
        }
        else
        {
            orig_xview = view_xview[0]
            orig_yview = view_yview[0]
        }
        if object_exists(asset_get_index("obj_mainchara"))
        {
            instance_deactivate_object(asset_get_index("obj_mainchara"))
            if object_exists(asset_get_index("obj_overworldc"))
                instance_deactivate_object(asset_get_index("obj_overworldc"))
        }
        if object_exists(asset_get_index("obj_caterpillarchara"))
            instance_deactivate_object(asset_get_index("obj_caterpillarchara"))
        else
            instance_deactivate_all(true)
        freecam = 1
    }
}
if (freecam == 1)
{
    zoom_mult_value = 0
    ypos_mult_value = 0
    xpos_mult_value = 0
    if keyboard_check(ord("I"))
        zoom_mult_value = -2
    if keyboard_check(ord("O"))
        zoom_mult_value = 2
    if keyboard_check(vk_up)
        ypos_mult_value = -2
    if keyboard_check(vk_down)
        ypos_mult_value = 2
    if keyboard_check(vk_left)
        xpos_mult_value = -2
    if keyboard_check(vk_right)
        xpos_mult_value = 2
    if (asset_get_index("__view_set") != -1 && asset_get_index("__view_get") != -1)
    {
        current_hview = script_execute(asset_get_index("__view_get"), 3, 0)
        current_wview = script_execute(asset_get_index("__view_get"), 2, 0)
        current_xview = script_execute(asset_get_index("__view_get"), 0, 0)
        current_yview = script_execute(asset_get_index("__view_get"), 1, 0)
        script_execute(asset_get_index("__view_set"), 3, 0, (current_hview + (3 * zoom_mult_value)))
        script_execute(asset_get_index("__view_set"), 2, 0, (current_wview + (4 * zoom_mult_value)))
        script_execute(asset_get_index("__view_set"), 0, 0, (current_xview + (4 * xpos_mult_value)))
        script_execute(asset_get_index("__view_set"), 1, 0, (current_yview + (4 * ypos_mult_value)))
    }
    else
    {
        current_hview = view_hview[0]
        current_wview = view_wview[0]
        current_xview = view_xview[0]
        current_yview = view_yview[0]
        view_hview[0] = (current_hview + (3 * zoom_mult_value))
        view_wview[0] = (current_wview + (4 * zoom_mult_value))
        view_xview[0] = (current_xview + (4 * xpos_mult_value))
        view_yview[0] = (current_yview + (4 * ypos_mult_value))
    }
    if mouse_check_button_pressed(mb_left)
    {
        if (asset_get_index("obj_marker") != -1)
        {
            if instance_exists(asset_get_index("obj_marker"))
                instance_destroy(asset_get_index("obj_marker"))
        }
        if (asset_get_index("obj_npc_marker") != -1)
        {
            if instance_exists(asset_get_index("obj_npc_marker"))
                instance_destroy(asset_get_index("obj_npc_marker"))
        }
        if (asset_get_index("spr_krisd") != -1)
            scr_marker(mouse_x, mouse_y, asset_get_index("spr_krisd"))
        if (asset_get_index("spr_maincharad") != -1)
            scr_marker(mouse_x, mouse_y, asset_get_index("spr_maincharad"))
        if (asset_get_index("obj_mainchara") != -1)
        {
            instance_activate_object(asset_get_index("obj_mainchara"))
            mainchar_obj = asset_get_index("obj_mainchara")
            mainchar_obj.x = mouse_x
            mainchar_obj.y = mouse_y
            mainchar_obj.xprevious = mouse_x
            mainchar_obj.yprevious = mouse_y
            instance_deactivate_object(asset_get_index("obj_mainchara"))
        }
    }
}


