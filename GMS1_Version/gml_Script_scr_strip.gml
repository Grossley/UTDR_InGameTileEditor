audio_stop_all()
//new_aud_stream = audio_create_stream("waiting_music.ogg")
//audio_play_sound(new_aud_stream, 10, true)
directory_create("presets")
for (room_no = 0; room_no <= room_last; room_no++)
{
    baseline_file = (((game_project_name + "_NEW/") + string(room_no)) + ".txt")
    overwrite_file = (("presets/" + string(room_no)) + ".txt")
    file_copy(baseline_file, overwrite_file)
    scr_remove_data(overwrite_file, 8)
    scr_remove_data(overwrite_file)
    preset_fileid = file_text_open_read(overwrite_file)
    concat_fileid = file_text_open_append((("presets/global" + string(floor((room_no / 37)))) + ".txt"))
    while (!file_text_eof(preset_fileid))
    {
        file_text_write_string(concat_fileid, file_text_read_string(preset_fileid))
        file_text_readln(preset_fileid)
        file_text_writeln(concat_fileid)
    }
    file_text_close(concat_fileid)
    file_text_close(preset_fileid)
}
for (i = 0; i <= floor((room_last / 37)); i++)
{
    global_path_name = (("presets/global" + string(i)) + ".txt")
    if file_exists(global_path_name)
    {
        scr_remove_data(global_path_name)
        concat_fileid = file_text_open_append("presets/global.txt")
        concat_old_fileid = file_text_open_read(global_path_name)
        while (!file_text_eof(concat_old_fileid))
        {
            file_text_write_string(concat_fileid, file_text_read_string(concat_old_fileid))
            file_text_readln(concat_old_fileid)
            file_text_writeln(concat_fileid)
        }
        file_text_close(concat_fileid)
        file_text_close(concat_old_fileid)
    }
}
file_copy("presets/global.txt", "presets/global_old.txt")
scr_remove_data("presets/global.txt", 16)
for (room_no = 0; room_no <= room_last; room_no++)
    scr_first_pass((("presets/" + string(room_no)) + ".txt"), "presets/global.txt")
scr_remove_data("presets/global.txt")
scr_remove_nan("presets/global.txt")
audio_stop_all()
//audio_destroy_stream(new_aud_stream)
for (room_no = 0; room_no <= room_last; room_no++)
{
    overwrite_file = (("presets/" + string(room_no)) + ".txt")
    scr_remove_nan(overwrite_file)
}
