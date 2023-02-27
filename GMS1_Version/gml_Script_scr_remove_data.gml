overwrite_file = argument[0]
inc_no = 1
if (argument_count == 2)
    inc_no = argument[1]
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
baseline_loaded = 0
baseline_loaded_background = 0
baseline_loaded_left = 0
baseline_loaded_top = 0
baseline_loaded_width = 0
baseline_loaded_height = 0
baseline_loaded_xscale = 0
baseline_loaded_yscale = 0
if (!file_exists(overwrite_file))
    show_error("Load of data 1 failed!", 0)
overwrite_fileid = file_text_open_read(overwrite_file)
maximus = 1
i = 0
while (!file_text_eof(overwrite_fileid))
{
    loaded[i] = i
    file_text_readln(overwrite_fileid)
    loaded_background[i] = real(file_text_read_string(overwrite_fileid))
    file_text_readln(overwrite_fileid)
    loaded_left[i] = real(file_text_read_string(overwrite_fileid))
    file_text_readln(overwrite_fileid)
    loaded_top[i] = real(file_text_read_string(overwrite_fileid))
    file_text_readln(overwrite_fileid)
    loaded_width[i] = real(file_text_read_string(overwrite_fileid))
    file_text_readln(overwrite_fileid)
    loaded_height[i] = real(file_text_read_string(overwrite_fileid))
    file_text_readln(overwrite_fileid)
    file_text_readln(overwrite_fileid)
    file_text_readln(overwrite_fileid)
    file_text_readln(overwrite_fileid)
    loaded_xscale[i] = real(file_text_read_string(overwrite_fileid))
    file_text_readln(overwrite_fileid)
    loaded_yscale[i] = real(file_text_read_string(overwrite_fileid))
    file_text_readln(overwrite_fileid)
    file_text_readln(overwrite_fileid)
    file_text_readln(overwrite_fileid)
    file_text_readln(overwrite_fileid)
    i++
}
loaded_length = array_length_1d(loaded)
baseline_loaded = array_create(loaded_length)
baseline_loaded_background = array_create(loaded_length)
baseline_loaded_left = array_create(loaded_length)
baseline_loaded_top = array_create(loaded_length)
baseline_loaded_width = array_create(loaded_length)
baseline_loaded_height = array_create(loaded_length)
baseline_loaded_xscale = array_create(loaded_length)
baseline_loaded_yscale = array_create(loaded_length)
array_copy(baseline_loaded, 0, loaded, 0, loaded_length)
array_copy(baseline_loaded_background, 0, loaded_background, 0, loaded_length)
array_copy(baseline_loaded_left, 0, loaded_left, 0, loaded_length)
array_copy(baseline_loaded_top, 0, loaded_top, 0, loaded_length)
array_copy(baseline_loaded_width, 0, loaded_width, 0, loaded_length)
array_copy(baseline_loaded_height, 0, loaded_height, 0, loaded_length)
array_copy(baseline_loaded_xscale, 0, loaded_xscale, 0, loaded_length)
array_copy(baseline_loaded_yscale, 0, loaded_yscale, 0, loaded_length)
file_text_close(overwrite_fileid)
for (j = 0; j < array_length_1d(baseline_loaded); j += inc_no)
{
    background_to_strip = baseline_loaded_background[j]
    left_to_strip = baseline_loaded_left[j]
    top_to_strip = baseline_loaded_top[j]
    width_to_strip = baseline_loaded_width[j]
    height_to_strip = baseline_loaded_height[j]
    xscale_to_strip = baseline_loaded_xscale[j]
    yscale_to_strip = baseline_loaded_yscale[j]
    hold_loaded = 0
    hold_loaded_background = 0
    hold_loaded_left = 0
    hold_loaded_top = 0
    hold_loaded_width = 0
    hold_loaded_height = 0
    hold_loaded_xscale = 0
    hold_loaded_yscale = 0
    hold_loaded[0] = -1
    hold_loaded_background[0] = -1
    hold_loaded_left[0] = -1
    hold_loaded_top[0] = -1
    hold_loaded_width[0] = -1
    hold_loaded_height[0] = -1
    hold_loaded_xscale[0] = -1
    hold_loaded_yscale[0] = -1
    hold_counter = 0
    for (i = 0; i < array_length_1d(loaded); i += 1)
    {
        if (loaded_background[i] != -1)
        {
            if (!(background_to_strip == loaded_background[i] && left_to_strip == loaded_left[i] && top_to_strip == loaded_top[i] && width_to_strip == loaded_width[i] && height_to_strip == loaded_height[i] && xscale_to_strip == loaded_xscale[i] && yscale_to_strip == loaded_yscale[i]))
            {
                hold_loaded[hold_counter] = i
                hold_loaded_background[hold_counter] = loaded_background[i]
                hold_loaded_left[hold_counter] = loaded_left[i]
                hold_loaded_top[hold_counter] = loaded_top[i]
                hold_loaded_width[hold_counter] = loaded_width[i]
                hold_loaded_height[hold_counter] = loaded_height[i]
                hold_loaded_xscale[hold_counter] = loaded_xscale[i]
                hold_loaded_yscale[hold_counter] = loaded_yscale[i]
                hold_counter += 1
            }
        }
    }
    hold_loaded_length = array_length_1d(hold_loaded)
    hold_loaded[hold_loaded_length] = i
    hold_loaded_background[hold_loaded_length] = background_to_strip
    hold_loaded_left[hold_loaded_length] = left_to_strip
    hold_loaded_top[hold_loaded_length] = top_to_strip
    hold_loaded_width[hold_loaded_length] = width_to_strip
    hold_loaded_height[hold_loaded_length] = height_to_strip
    hold_loaded_xscale[hold_loaded_length] = xscale_to_strip
    hold_loaded_yscale[hold_loaded_length] = yscale_to_strip
    hold_loaded_length += 1
    loaded = 0
    loaded_background = 0
    loaded_left = 0
    loaded_top = 0
    loaded_width = 0
    loaded_height = 0
    loaded_xscale = 0
    loaded_yscale = 0
    loaded = array_create(hold_loaded_length)
    loaded_background = array_create(hold_loaded_length)
    loaded_left = array_create(hold_loaded_length)
    loaded_top = array_create(hold_loaded_length)
    loaded_width = array_create(hold_loaded_length)
    loaded_height = array_create(hold_loaded_length)
    loaded_xscale = array_create(hold_loaded_length)
    loaded_yscale = array_create(hold_loaded_length)
    array_copy(loaded, 0, hold_loaded, 0, hold_loaded_length)
    array_copy(loaded_background, 0, hold_loaded_background, 0, hold_loaded_length)
    array_copy(loaded_left, 0, hold_loaded_left, 0, hold_loaded_length)
    array_copy(loaded_top, 0, hold_loaded_top, 0, hold_loaded_length)
    array_copy(loaded_width, 0, hold_loaded_width, 0, hold_loaded_length)
    array_copy(loaded_height, 0, hold_loaded_height, 0, hold_loaded_length)
    array_copy(loaded_xscale, 0, hold_loaded_xscale, 0, hold_loaded_length)
    array_copy(loaded_yscale, 0, hold_loaded_yscale, 0, hold_loaded_length)
    hold_loaded = 0
    hold_loaded_background = 0
    hold_loaded_left = 0
    hold_loaded_top = 0
    hold_loaded_width = 0
    hold_loaded_height = 0
    hold_loaded_xscale = 0
    hold_loaded_yscale = 0
}
overwrite_fileid = file_text_open_write(overwrite_file)
for (i = 0; i < array_length_1d(loaded); i += 1)
{
    if (loaded_background[i] != -1)
    {
        file_text_write_string(overwrite_fileid, "NAN")
        file_text_writeln(overwrite_fileid)
        file_text_write_string(overwrite_fileid, string(loaded_background[i]))
        file_text_writeln(overwrite_fileid)
        file_text_write_string(overwrite_fileid, string(loaded_left[i]))
        file_text_writeln(overwrite_fileid)
        file_text_write_string(overwrite_fileid, string(loaded_top[i]))
        file_text_writeln(overwrite_fileid)
        file_text_write_string(overwrite_fileid, string(loaded_width[i]))
        file_text_writeln(overwrite_fileid)
        file_text_write_string(overwrite_fileid, string(loaded_height[i]))
        file_text_writeln(overwrite_fileid)
        file_text_write_string(overwrite_fileid, "NAN")
        file_text_writeln(overwrite_fileid)
        file_text_write_string(overwrite_fileid, "NAN")
        file_text_writeln(overwrite_fileid)
        file_text_write_string(overwrite_fileid, "NAN")
        file_text_writeln(overwrite_fileid)
        file_text_write_string(overwrite_fileid, string(loaded_xscale[i]))
        file_text_writeln(overwrite_fileid)
        file_text_write_string(overwrite_fileid, string(loaded_yscale[i]))
        file_text_writeln(overwrite_fileid)
        file_text_write_string(overwrite_fileid, "NAN")
        file_text_writeln(overwrite_fileid)
        file_text_write_string(overwrite_fileid, "NAN")
        file_text_writeln(overwrite_fileid)
        file_text_write_string(overwrite_fileid, "NAN")
        file_text_writeln(overwrite_fileid)
    }
}
file_text_close(overwrite_fileid)
