if keyboard_check_pressed(vk_f2)
    audio_stop_all()
current_volume = audio_get_master_gain(0)
if keyboard_check(ord("9"))
    audio_master_gain((current_volume + 0.01))
if keyboard_check(ord("0"))
    audio_master_gain((current_volume - 0.01))