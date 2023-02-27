scr_freecam() // Freecam (use F to toggle, I to zoom in, O to zoom out, arrows to move, click to place player object)
scr_fps_toggle() // FPS toggle (F2)
scr_runtoggle() // Boost player speed (able to run) in the overworld (F3 to toggle, Backspace to run)
scr_layer_delete() // Toggle using F5
if (keyboard_check_pressed(vk_f7))
    scr_invincibility() // Invincibility in battle (much higher HP) (F7 to activate)
if (keyboard_check(vk_f8))
    scr_onepunchman() // Increased damage output (Instant 1 shot attacks on basically all enemies to 0 hp) (F8 to activate)
if (keyboard_check(vk_f9))
    scr_jump_rooms() // Teleport between rooms (Use while holding F9, press F11 to select a specific room, up and down arrow keys to advance)
scr_noclip() // Walk through walls (F10 to toggle)
 