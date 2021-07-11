if (frame_skip <= 2)
    exit
if ((!file_exists("go")) && parse_rooms_on_load == 1)
{
    audio_stop_all()
    show_message("The game will parse the game rooms for tile and preset data. 
    This is required for functionality and will only occur once. 
    Weird visuals/audio may happen during this period. This is normal. 
    When it is complete, the game will close. 
    Upon reopening the game, the tile editor will be available for use.")
    debug_file = file_text_open_write("go")
    file_text_writeln(debug_file)
    file_text_close(debug_file)
}
if (stop == 0 && file_exists("go") && (!file_exists("halt")))
{
    file_delete((safe_path + "go"))
    first_file = file_find_first((safe_path + "*"), 0)
    if (!directory_exists("TEMP"))
        directory_create("TEMP")
    file_copy((safe_path + filename_name(first_file)), ("TEMP/" + filename_name(first_file)))
    file_delete((safe_path + first_file))
    while 1
    {
        next_file = file_find_next()
        if (next_file != "")
        {
            file_copy((safe_path + filename_name(next_file)), ("TEMP/" + filename_name(next_file)))
            file_delete((safe_path + next_file))
            continue
        }
        else
        {
            file_find_close()
            debug_file = file_text_open_write((safe_path + "go"))
            file_text_writeln(debug_file)
            file_text_close(debug_file)
            stop = 1
            break
        }
    }
}
if (file_exists("go") && (!file_exists("halt")))
{
    scr_generate_presets()
    interrupted = 0
    i = room_first
    while (i <= room_last)
    {
        if (!(file_exists((((game_project_name + "_ORIG/") + string(i)) + ".txt")) && file_exists((((game_project_name + "_NEW/") + string(i)) + ".txt"))))
        {
            interrupted = 1
            cur_attempt = i
            if (prev_attempt == cur_attempt)
                attempt_count += 1
            else
                attempt_count = 0
            prev_attempt = cur_attempt
            if (attempt_count >= 5)
            {
                debug_file = file_text_open_write((((game_project_name + "_ORIG/") + string(i)) + ".txt"))
                file_text_writeln(debug_file)
                file_text_close(debug_file)
                debug_file = file_text_open_write((((game_project_name + "_NEW/") + string(i)) + ".txt"))
                file_text_writeln(debug_file)
                file_text_close(debug_file)
                attempt_count = 0
                break
            }
            else
            {
                room_goto(i)
                break
            }
        }
        else
        {
            i++
            continue
        }
    }
    debug_file = file_text_open_append("rooms.txt")
    file_text_write_string(debug_file, string(room))
    file_text_writeln(debug_file)
    file_text_close(debug_file)
    if (interrupted == 0)
    {
        file_delete((safe_path + "go"))
        first_file = file_find_first((safe_path + "*"), 0)
        file_delete(first_file)
        while 1
        {
            next_file = file_find_next()
            if (next_file != "")
            {
                file_delete(next_file)
                continue
            }
            else
            {
                file_find_close()
                break
            }
        }
        first_file = file_find_first((safe_path + "TEMP/*"), 0)
        file_copy(((safe_path + "TEMP/") + filename_name(first_file)), (safe_path + filename_name(first_file)))
        file_delete(((safe_path + "TEMP/") + first_file))
        while 1
        {
            next_file = file_find_next()
            if (next_file != "")
            {
                file_copy(((safe_path + "TEMP/") + filename_name(next_file)), (safe_path + filename_name(next_file)))
                file_delete(((safe_path + "TEMP/") + next_file))
                continue
            }
            else
            {
                file_find_close()
                debug_file = file_text_open_write((safe_path + "go"))
                file_text_writeln(debug_file)
                file_text_close(debug_file)
                break
            }
        }
        debug_file = file_text_open_write("halt")
        file_text_writeln(debug_file)
        file_text_close(debug_file)
        scr_strip()
        show_message("Complete. The game will now close. Please reopen the game to use the tile editor.")
        game_end()
    }
}
