if keyboard_check_pressed(vk_f2)
{
    global.interact = 0
    if (global.phasing == 0)
        global.phasing = 1
    else
        global.phasing = 0
}