write_preset_background = argument[0]
write_preset_left = argument[1]
write_preset_top = argument[2]
write_preset_width = argument[3]
write_preset_height = argument[4]
write_preset_xscale = argument[5]
write_preset_yscale = argument[6]
if (write_preset_file_loc == "l" || write_preset_file_loc == "lg")
{
    file = (("presets/" + string(room)) + ".txt")
    myfileid = file_text_open_append(file)
    file_text_write_string(myfileid, string(write_preset_background))
    file_text_writeln(myfileid)
    file_text_write_string(myfileid, string(write_preset_left))
    file_text_writeln(myfileid)
    file_text_write_string(myfileid, string(write_preset_top))
    file_text_writeln(myfileid)
    file_text_write_string(myfileid, string(write_preset_width))
    file_text_writeln(myfileid)
    file_text_write_string(myfileid, string(write_preset_height))
    file_text_writeln(myfileid)
    file_text_write_string(myfileid, string(write_preset_xscale))
    file_text_writeln(myfileid)
    file_text_write_string(myfileid, string(write_preset_yscale))
    file_text_writeln(myfileid)
    file_text_close(myfileid)
}
if (write_preset_file_loc == "g" || write_preset_file_loc == "lg")
{
    file = "presets/global.txt"
    myfileid = file_text_open_append(file)
    file_text_write_string(myfileid, string(write_preset_background))
    file_text_writeln(myfileid)
    file_text_write_string(myfileid, string(write_preset_left))
    file_text_writeln(myfileid)
    file_text_write_string(myfileid, string(write_preset_top))
    file_text_writeln(myfileid)
    file_text_write_string(myfileid, string(write_preset_width))
    file_text_writeln(myfileid)
    file_text_write_string(myfileid, string(write_preset_height))
    file_text_writeln(myfileid)
    file_text_write_string(myfileid, string(write_preset_xscale))
    file_text_writeln(myfileid)
    file_text_write_string(myfileid, string(write_preset_yscale))
    file_text_writeln(myfileid)
    file_text_close(myfileid)
}
scr_load_presets()
