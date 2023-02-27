game_temp_save = 0
if (argument_count > 0)
    game_temp_save = argument[0]
greatest_value = 0
file_list = 0
file_list[0] = 0
if (!directory_exists("tempsaves"))
    directory_create("tempsaves")
temp_save_dir = (("tempsaves/" + string(room)) + "/")
if (!directory_exists(temp_save_dir))
    directory_create(temp_save_dir)
if (!file_exists((temp_save_dir + "0.txt")))
    file_copy(((((safe_path + game_project_name) + "_NEW/") + string(room)) + ".txt"), ((safe_path + "tempsaves/") + "0.txt"))
file_list[0] = file_find_first((((safe_path + game_project_name) + "_NEW/") + "*"), 0)
i = 1
while 1
{
    next_file = file_find_next()
    if (next_file != "")
    {
        file_list[i] = next_file
        i++
        continue
    }
    else
        break
}
for (i = 0; i < array_length_1d(file_list); i++)
    file_list[i] = real(string_digits(file_list[i]))
for (i = 0; i < array_length_1d(file_list); i++)
{
    if ((i - 1) >= 0)
    {
        if (file_list[i] > file_list[(i - 1)])
            greatest_value = file_list[i]
    }
}
if (array_length_1d(file_list) == 1)
    greatest_value = 0
if keyboard_check_pressed(ord("U"))
{
    current_temp_save_value -= 1
    if (current_temp_save_value < 0)
        current_temp_save_value = 0
    scr_temp_load(current_temp_save_value)
}
if keyboard_check_pressed(ord("R"))
{
    current_temp_save_value += 1
    if (current_temp_save_value > greatest_value)
        current_temp_save_value = greatest_value
    scr_temp_load(current_temp_save_value)
}
if (game_temp_save == 1)
{
    for (i = (current_temp_save_value + 1); i < (greatest_value + 1); i++)
        file_delete(((((safe_path + "/") + temp_save_dir) + string(i)) + ".txt"))
    current_temp_save_value += 1
    scr_temp_save(current_temp_save_value)
    scr_temp_load(current_temp_save_value)
    greatest_value = current_temp_save_value
    game_temp_save = 0
}
if (!file_exists(((((safe_path + "/") + temp_save_dir) + string(current_temp_save_value)) + ".txt")))
{
    scr_temp_save(current_temp_save_value)
    scr_temp_load(current_temp_save_value)
}
