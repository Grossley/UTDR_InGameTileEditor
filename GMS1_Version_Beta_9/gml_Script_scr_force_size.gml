if (string_lower(game_project_name) == "undertale")
{
    expected_width = 640
    expected_height = 480
}
else if (string_lower(game_project_name) == "nxtale")
{
    expected_width = 640
    expected_height = 480
}
else if (string_pos("undertale", string_lower(game_project_name)) != 0)
{
    expected_width = 640
    expected_height = 480
}
else if (string_pos("under", string_lower(game_project_name)) != 0 || string_pos("tale", string_lower(game_project_name)) != 0)
{
    expected_width = 640
    expected_height = 480
}
else if (string_lower(game_project_name) == "deltarune")
{
    expected_width = 1280
    expected_height = 960
}
else if (string_pos("deltarune", string_lower(game_project_name)) != 0)
{
    expected_width = 1280
    expected_height = 960
}
else if (string_pos("delta", string_lower(game_project_name)) != 0 || string_pos("rune", string_lower(game_project_name)) != 0)
{
    expected_width = 1280
    expected_height = 960
}
if (window_get_height() != expected_height)
    window_set_size(window_get_width(), expected_height)
if (window_get_width() != expected_width)
    window_set_size(expected_width, window_get_height())


