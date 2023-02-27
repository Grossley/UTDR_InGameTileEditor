if keyboard_check_pressed(vk_f2)
{
    if (room_speed == 30)
        room_speed = 60
    else if (room_speed == 60)
        room_speed = 30
    else
        room_speed = 30
}
