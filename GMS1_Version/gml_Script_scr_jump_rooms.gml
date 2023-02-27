if keyboard_check_pressed(vk_up)
    room_goto_next()
else if keyboard_check_pressed(vk_down)
    room_goto_previous()
else if keyboard_check_pressed(vk_f11)
    room_goto(get_integer("Enter room number", room))
global.interact = 0