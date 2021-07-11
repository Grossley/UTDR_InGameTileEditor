preset = 0
preset_background = 0
preset_left = 0
preset_top = 0
preset_width = 0
preset_height = 0
preset_xscale = 0
preset_yscale = 0
preset[0] = -1
preset_background[0] = -1
preset_left[0] = -1
preset_top[0] = -1
preset_width[0] = -1
preset_height[0] = -1
preset_xscale[0] = -1
preset_yscale[0] = -1
maximus = 0
if (write_preset_file_loc == "l" || write_preset_file_loc == "lg")
{
    file = (("presets/" + string(room)) + ".txt")
    if (!file_exists(file))
        show_error("Load of preset data 1 failed!", 0)
    safe_file_name = (filename_path(file) + file)
    myfileid = file_text_open_read(file)
    maximus = 1
    i = 0
    while (!file_text_eof(myfileid))
    {
        preset[i] = i
        preset_background[i] = real(file_text_read_string(myfileid))
        file_text_readln(myfileid)
        preset_left[i] = real(file_text_read_string(myfileid))
        file_text_readln(myfileid)
        preset_top[i] = real(file_text_read_string(myfileid))
        file_text_readln(myfileid)
        preset_width[i] = real(file_text_read_string(myfileid))
        file_text_readln(myfileid)
        preset_height[i] = real(file_text_read_string(myfileid))
        file_text_readln(myfileid)
        preset_xscale[i] = real(file_text_read_string(myfileid))
        file_text_readln(myfileid)
        preset_yscale[i] = real(file_text_read_string(myfileid))
        file_text_readln(myfileid)
        i++
    }
    file_text_close(myfileid)
}
if (write_preset_file_loc == "g" || write_preset_file_loc == "lg")
{
    file = "presets/global.txt"
    if (!file_exists(file))
        show_error("Load of preset data 2 failed!", 0)
    if file_exists(file)
    {
        myfileid = file_text_open_read(file)
        if (maximus == 1 && preset[0] != -1)
            i = array_length_1d(preset)
        else
            i = 0
        while (!file_text_eof(myfileid))
        {
            preset[i] = i
            preset_background[i] = real(file_text_read_string(myfileid))
            file_text_readln(myfileid)
            preset_left[i] = real(file_text_read_string(myfileid))
            file_text_readln(myfileid)
            preset_top[i] = real(file_text_read_string(myfileid))
            file_text_readln(myfileid)
            preset_width[i] = real(file_text_read_string(myfileid))
            file_text_readln(myfileid)
            preset_height[i] = real(file_text_read_string(myfileid))
            file_text_readln(myfileid)
            preset_xscale[i] = real(file_text_read_string(myfileid))
            file_text_readln(myfileid)
            preset_yscale[i] = real(file_text_read_string(myfileid))
            file_text_readln(myfileid)
            i++
        }
    }
    file_text_close(myfileid)
}
