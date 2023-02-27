Made by Grossley#2869
Changes in Beta Version 5 (October 21st, 2020): Initial release
Changes in Beta Version 6 (October 21st, 2020): Fixed a bug causing freecam to not work as expected in Undertale.
Changes in Beta Version 7 (October 22nd, 2020): "gml_Script_tile_set_alpha.gml" was accidentally omitted, causing a bug. Fixed.
Changes in Beta Version 8 (October 22nd, 2020): Quality of life improvements regarding games whose file names may have been changed or are otherwise not identifiable (such as for UndertaleBnP).
Changes in Beta Version 9 (October 22nd, 2020): Borders are forcibly disabled to prevent incorrect mouse_x and mouse_y output (no idea why this happens).
Changes in Beta Version 10 (February 26th, 2023): A lot of changes, addition of super freecam for Shesez.

IT IS NOT RECOMMENDED TO USE THIS MOD WITH DEBUG MODE DUE TO KEY CONFLICTS. PLEASE DISABLE DEBUG MODE IF IT IS ENABLED.

The tile editor is not accessible during preset and tile creation.
Please allow about 10 minutes for Undertale and 1-2 minutes for Deltarune to complete this creation process.
After the process is complete the game must close. Please manually reopen the game to use the tile editor.

These keys do the following in all modes:
"1": Advance 1 mode
"2": Go back 1 mode
"3": Advance 5 modes
"4": Go back 5 modes
"M": Switch the preset mode. The preset modes available are local only, global only, or local and global. 
"U": Undoes your most recent action using the novel history tracking feature.
"R": Redoes your most recent action using the novel history tracking feature.
(Undo/Redo feature)
"G": Turns off all text and other GUI stuff in the way of the game (yeah!!!!!!!!!!!!!!!!)
"F3": Turn on or off the preview tile.
"F12": Go directly to a mode number.

If you exit a room without saving then re-enter, you can restore your most recent changes using "R" in order to save.

There is currently a maximum of 30 modes. However, only modes 1 through 24 are implemented.
To import your changes into UndertaleModTool, you MUST save your changes using mode 7. Then re-run "TileSetup.csx" and select "NO" when asked if you want to set up the tile editor.
After importing your changes, it is recommended to use mode 12 (Wipe all data to pre-install state and close game) so that the tile and preset data can be re-created.

Those modes are as follows:
Mode 01: Drag (Drag using left click) ("F2" for tile transform tool, can paint tiles to match a specific tile or to have a specific property, for more details please refer to the drag tile documentation.)
Mode 02: Add ("P": reset preview tile, "6": toggle grid mode (in grid mode you can drag and place tiles instead of placing a single tile), "7": increase preset index, "8": decrease preset index, "9": specify preset index, "0": specify depth 0 by default) (Left click to add tile, right click to drag)
Mode 03: Delete (Delete a single tile with the left click)
Mode 04: Duplicate (Left click to duplicate, right click to drag/reposition) 
Mode 05: Reset to Original Game Tile Layout (Permanent) ("F2")
Mode 06: Freecam ("F" to enable freecam, "I" to zoom in, "O" to zoom out, arrow keys to pan across the map, left click to place obj_mainchara at any location on the map)
Mode 07: Save Custom Layout ("F2")
Mode 08: Add Preset from Tile (Left click to add to preset)
Mode 09: Reset to Last Saved Custom Layout ("F2") (All editing history will be lost.)
Mode 10: Edit Existing Preset ("F2" to edit, "P": reset preview tile, "7": increase preset index, "8": decrease preset index, "9": specify preset index) 
Mode 11: Toggle game FPS between 30 and 60 FPS ("F2" to toggle)
Mode 12: Wipe all data to pre-install state and close game ("F2")
Mode 13: UNIMPLEMENTED
Mode 14: Delete an entire layer at once (select tile with desired depth, then press "F2")
Mode 15: Bulk Delete (Toggle with "F2", delete with the left mouse click)
Mode 16: Restart Game ("Enter" will restart the game without warning)
Mode 17: Delete Pre-Existing Preset ("F2" to delete) ("P": reset preview tile, "7": increase preset index, "8": decrease preset index, "9": specify preset index) 
Mode 18: Clear Room Editing History ("F2")
Mode 19: Jump Rooms (Arrow up to increase, arrow down to decrease, "F11" to manually specify room number)
Mode 20: Debug Toggle ("F2" to toggle)
Mode 21: Free/Unstick player ("F2" to unstick the player)
Mode 22: Game Save/Load ("S" to save, "L" to load)
Mode 23: Save/Load a Game Savestate ("S" to save, "L" to load, "Q" to change the savestate slot, "0" to delete) 
Mode 24: Stop all playing sounds ("F2"), adjust game volume ("9" to increase, "0" to decrease)
Mode 25: Makes you invincible in battle.
Mode 26: No-clip (F10 to toggle)
Mode 27: One Punch Man Mode (Instantly kill any enemy)
Mode 28: Toggle Run (Backspace to run, F6 to toggle).
Mode 29: Super Freecam
* Freecam (use F to toggle, I to zoom in, O to zoom out, arrows to move, click to place player object)
* Boost player speed (able to run) in the overworld (F6 to toggle, Backspace to run)
* Invincibility in battle (much higher HP) (F7 to activate)
* Increased damage output (Instant 1 shot attacks on basically all enemies to 0 hp) (F8 to activate)
* Teleport between rooms (Use while holding F9, press F11 to select a specific room, up and down arrow keys to increase/decrease room number respectively)
* Walk through walls (F10 to toggle)
Modes 30-40: UNIMPLEMENTED

Preview tiles are available for all modes involving presets (modes 2, 8, 10, 17).

The tile editor generally shows the following by default on the left side of the screen:
Tile Count: This is the number of tiles that are in a given room.
Current Tile Index: The index number of the current tile.
Background Name: The background of the given current tile.
Current Tile Left: The X value of the top left corner of the current tile (relative to the background from which it is from).
Current Tile Top: The Y value of the top left corner of the current tile (relative to the background from which it is from).
Current Tile Width: The current tile's width.
Current Tile Height: The current tile's height.
Current Tile X Scale: The X scale of the current tile.
Current Tile Y Scale: The Y scale of the current tile.
Current Tile Alpha: The alpha of the current tile.
Current Tile Blend: The color of the current tile.
Current Tile Visible: The visibility of the current tile (true or false).
Current Tile Depth: The depth of the current tile.
Current Tile X Position: The X position of the current tile.
Current Tile Y Position: The Y position of the current tile.

The font used to display this information will either be:
"fnt_maintext" for Undertale,
"fnt_main" for Deltarune,
or the font at index 0 for other games. 

The font does not increase in size if the window is set to fullscreen.

For more documentation please refer to the specific entries in the "Documentation" folder.