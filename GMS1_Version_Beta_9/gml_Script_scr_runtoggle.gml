if keyboard_check_pressed(vk_f3)
{
    global.interact = 0
    if (global.runtoggle == 0)
        global.runtoggle = 1
    else
        global.runtoggle = 0
}