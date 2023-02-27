tile_count = ("Currently Selected Savestate Slot: " + string(current_savestate_slot))
if keyboard_check_pressed(ord("Q"))
{
    current_savestate_slot += 1
    if (current_savestate_slot > 10)
        current_savestate_slot = 0
}
savestate_filename = ("savestate" + string(current_savestate_slot))
if keyboard_check_pressed(ord("S"))
{    
    if show_question("Changes to the data.win file will likely result in the savestate data becoming invalid. If you try to load invalid savestate the game will crash. If a savestate is invalid, please overwrite or delete it. If you understand this and wish to proceed, select YES.")
        game_save(savestate_filename)
}
if keyboard_check_pressed(ord("0"))
{
    if file_exists(savestate_filename)
    {
        if show_question("Would you like to delete the current savestate?")
        file_delete(savestate_filename)
    }    
    else        
        show_message("No savestate data to delete!")
}
if keyboard_check_pressed(ord("L"))
{
    if file_exists(savestate_filename)
        game_load(savestate_filename)
    else
        show_message("No savestate data to load!")
}
