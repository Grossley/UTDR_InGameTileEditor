if (strip_nan == 0)
    exit
file01 = argument0
loaded = 0
loaded_background = 0
loaded_left = 0
loaded_top = 0
loaded_width = 0
loaded_height = 0
loaded_xscale = 0
loaded_yscale = 0
myfileid_02 = file_text_open_read(file01)
i = 0
while (!file_text_eof(myfileid_02))
{
    loaded[i] = i
    file_text_readln(myfileid_02)
    loaded_background[i] = real(file_text_read_string(myfileid_02))
    file_text_readln(myfileid_02)
    loaded_left[i] = real(file_text_read_string(myfileid_02))
    file_text_readln(myfileid_02)
    loaded_top[i] = real(file_text_read_string(myfileid_02))
    file_text_readln(myfileid_02)
    loaded_width[i] = real(file_text_read_string(myfileid_02))
    file_text_readln(myfileid_02)
    loaded_height[i] = real(file_text_read_string(myfileid_02))
    file_text_readln(myfileid_02)
    file_text_readln(myfileid_02)
    file_text_readln(myfileid_02)
    file_text_readln(myfileid_02)
    loaded_xscale[i] = real(file_text_read_string(myfileid_02))
    file_text_readln(myfileid_02)
    loaded_yscale[i] = real(file_text_read_string(myfileid_02))
    file_text_readln(myfileid_02)
    file_text_readln(myfileid_02)
    file_text_readln(myfileid_02)
    file_text_readln(myfileid_02)
    i++
}
file_text_close(myfileid_02)
myfileid_03 = file_text_open_write(file01)
for (i = 0; i < array_length_1d(loaded); i += 1)
{
    file_text_write_string(myfileid_03, string(loaded_background[i]))
    file_text_writeln(myfileid_03)
    file_text_write_string(myfileid_03, string(loaded_left[i]))
    file_text_writeln(myfileid_03)
    file_text_write_string(myfileid_03, string(loaded_top[i]))
    file_text_writeln(myfileid_03)
    file_text_write_string(myfileid_03, string(loaded_width[i]))
    file_text_writeln(myfileid_03)
    file_text_write_string(myfileid_03, string(loaded_height[i]))
    file_text_writeln(myfileid_03)
    file_text_write_string(myfileid_03, string(loaded_xscale[i]))
    file_text_writeln(myfileid_03)
    file_text_write_string(myfileid_03, string(loaded_yscale[i]))
    file_text_writeln(myfileid_03)
}
file_text_close(myfileid_03)
loaded = 0
loaded_background = 0
loaded_left = 0
loaded_top = 0
loaded_width = 0
loaded_height = 0
loaded_xscale = 0
loaded_yscale = 0
