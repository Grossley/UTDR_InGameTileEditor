loaded = 0
loaded_background = 0
loaded_left = 0
loaded_top = 0
loaded_width = 0
loaded_height = 0
loaded_xscale = 0
loaded_yscale = 0
loaded[0] = -1
loaded_background[0] = -1
loaded_left[0] = -1
loaded_top[0] = -1
loaded_width[0] = -1
loaded_height[0] = -1
loaded_xscale[0] = -1
loaded_yscale[0] = -1
if (write_preset_file_loc == "l" || write_preset_file_loc == "lg")
{
    file = (("presets/" + string(room)) + ".txt")
    if (!file_exists(file))
        show_error("Load of data 1 failed!", 0)
    safe_file_name = (filename_path(file) + file)
    myfileid = file_text_open_read(file)
    maximus = 1
    i = 0
    while (!file_text_eof(myfileid))
    {
        loaded[i] = i
        loaded_background[i] = real(file_text_read_string(myfileid))
        file_text_readln(myfileid)
        loaded_left[i] = real(file_text_read_string(myfileid))
        file_text_readln(myfileid)
        loaded_top[i] = real(file_text_read_string(myfileid))
        file_text_readln(myfileid)
        loaded_width[i] = real(file_text_read_string(myfileid))
        file_text_readln(myfileid)
        loaded_height[i] = real(file_text_read_string(myfileid))
        file_text_readln(myfileid)
        loaded_xscale[i] = real(file_text_read_string(myfileid))
        file_text_readln(myfileid)
        loaded_yscale[i] = real(file_text_read_string(myfileid))
        file_text_readln(myfileid)
        i++
    }
    file_text_close(myfileid)
    myfileid = file_text_open_write(file)
    for (i = 0; i < array_length_1d(loaded); i += 1)
    {
        if (loaded_background[i] != -1)
        {
            if (!(preset_background[preset_index] == loaded_background[i] && preset_left[preset_index] == loaded_left[i] && preset_top[preset_index] == loaded_top[i] && preset_width[preset_index] == loaded_width[i] && preset_height[preset_index] == loaded_height[i] && preset_xscale[preset_index] == loaded_xscale[i] && preset_yscale[preset_index] == loaded_yscale[i]))
            {
                file_text_write_string(myfileid, string(loaded_background[i]))
                file_text_writeln(myfileid)
                file_text_write_string(myfileid, string(loaded_left[i]))
                file_text_writeln(myfileid)
                file_text_write_string(myfileid, string(loaded_top[i]))
                file_text_writeln(myfileid)
                file_text_write_string(myfileid, string(loaded_width[i]))
                file_text_writeln(myfileid)
                file_text_write_string(myfileid, string(loaded_height[i]))
                file_text_writeln(myfileid)
                file_text_write_string(myfileid, string(loaded_xscale[i]))
                file_text_writeln(myfileid)
                file_text_write_string(myfileid, string(loaded_yscale[i]))
                file_text_writeln(myfileid)
            }
        }
    }
    file_text_close(myfileid)
}
loaded = 0
loaded_background = 0
loaded_left = 0
loaded_top = 0
loaded_width = 0
loaded_height = 0
loaded_xscale = 0
loaded_yscale = 0
loaded[0] = -1
loaded_background[0] = -1
loaded_left[0] = -1
loaded_top[0] = -1
loaded_width[0] = -1
loaded_height[0] = -1
loaded_xscale[0] = -1
loaded_yscale[0] = -1
if (write_preset_file_loc == "g" || write_preset_file_loc == "lg")
{
    file = "presets/global.txt"
    if (!file_exists(file))
        show_error("Load of data 2 failed!", 0)
    if file_exists(file)
    {
        myfileid = file_text_open_read(file)
        i = 0
        while (!file_text_eof(myfileid))
        {
            loaded[i] = i
            loaded_background[i] = real(file_text_read_string(myfileid))
            file_text_readln(myfileid)
            loaded_left[i] = real(file_text_read_string(myfileid))
            file_text_readln(myfileid)
            loaded_top[i] = real(file_text_read_string(myfileid))
            file_text_readln(myfileid)
            loaded_width[i] = real(file_text_read_string(myfileid))
            file_text_readln(myfileid)
            loaded_height[i] = real(file_text_read_string(myfileid))
            file_text_readln(myfileid)
            loaded_xscale[i] = real(file_text_read_string(myfileid))
            file_text_readln(myfileid)
            loaded_yscale[i] = real(file_text_read_string(myfileid))
            file_text_readln(myfileid)
            i++
        }
    }
    file_text_close(myfileid)
    myfileid = file_text_open_write(file)
    for (i = 0; i < array_length_1d(loaded); i += 1)
    {
        if (loaded_background[i] != -1)
        {
            if (!(preset_background[preset_index] == loaded_background[i] && preset_left[preset_index] == loaded_left[i] && preset_top[preset_index] == loaded_top[i] && preset_width[preset_index] == loaded_width[i] && preset_height[preset_index] == loaded_height[i] && preset_xscale[preset_index] == loaded_xscale[i] && preset_yscale[preset_index] == loaded_yscale[i]))
            {
                file_text_write_string(myfileid, string(loaded_background[i]))
                file_text_writeln(myfileid)
                file_text_write_string(myfileid, string(loaded_left[i]))
                file_text_writeln(myfileid)
                file_text_write_string(myfileid, string(loaded_top[i]))
                file_text_writeln(myfileid)
                file_text_write_string(myfileid, string(loaded_width[i]))
                file_text_writeln(myfileid)
                file_text_write_string(myfileid, string(loaded_height[i]))
                file_text_writeln(myfileid)
                file_text_write_string(myfileid, string(loaded_xscale[i]))
                file_text_writeln(myfileid)
                file_text_write_string(myfileid, string(loaded_yscale[i]))
                file_text_writeln(myfileid)
            }
        }
    }
    file_text_close(myfileid)
}
loaded = 0
loaded_background = 0
loaded_left = 0
loaded_top = 0
loaded_width = 0
loaded_height = 0
loaded_xscale = 0
loaded_yscale = 0
