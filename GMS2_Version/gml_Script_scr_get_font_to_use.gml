font_option = 0
zero_var = "0"
i = real(zero_var)
while font_exists(i)
{
    font_option[i] = i
    i++
}
font_option_length = array_length_1d(font_option)
if (font_option_length == 0)
{
    show_message("A font is required to use the tile editor. The game will now end.")
    game_end()
}
else
    font_to_use = font_option[0]
if (string_lower(game_project_name) == "undertale")
{
    if (font_option_length > 2)
        font_to_use = font_option[2]
}
else if (string_lower(game_project_name) == "nxtale")
{
    if (font_option_length > 2)
        font_to_use = font_option[2]
}
else if (string_pos("undertale", string_lower(game_project_name)) != 0)
{
    if (font_option_length > 2)
        font_to_use = font_option[2]
}
else if (string_pos("under", string_lower(game_project_name)) != 0 || string_pos("tale", string_lower(game_project_name)) != 0)
{
    if (font_option_length > 2)
        font_to_use = font_option[2]
}
else if (string_lower(game_project_name) == "deltarune")
{
    if (font_option_length > 3)
        font_to_use = font_option[3]
}
else if (string_pos("deltarune", string_lower(game_project_name)) != 0)
{
    if (font_option_length > 3)
        font_to_use = font_option[3]
}
else if (string_pos("delta", string_lower(game_project_name)) != 0 || string_pos("rune", string_lower(game_project_name)) != 0)
{
    if (font_option_length > 3)
        font_to_use = font_option[3]
}
else
{
    if (font_option_length > 3)
        font_to_use = font_option[3]
    while 1
    {
        font_to_use = get_integer(("The game could not be identified. Please enter the ID of the font you wish to use. Font range: 0-" + string((font_option_length - 1))), font_to_use)
        if font_exists(font_to_use)
            break
        else
            continue
    }
}