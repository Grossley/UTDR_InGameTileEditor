using System;
using System.IO;
using UndertaleModLib.Util;

EnsureDataLoaded();

int progress = 0;
string result = " No operation took place.";

bool FirstTimeSetup = ScriptQuestion("Would you like to set up the tile editor?");
if (FirstTimeSetup)
{
    if (ScriptQuestion("Is debug mode enabled?"))
    {
        if (!(ScriptQuestion("Debug mode may interfere with the usage of this tool. Are you sure you want to continue with debug mode on?")))
        {
            return;
        }
    }
    Data.Options.Info = Data.Options.Info | UndertaleOptions.OptionsFlags.ShowCursor;
    SetUpTileEditor();
    result = " The tile editor was set up.";
}
else
{
    bool ImportTiles = ScriptQuestion("Would you like to re-import the tiles from the game?");
    if (ImportTiles)
    {
        UpdateProgress();
        ReplaceTiles();
        result = " All tiles were re-imported.";
    }
}

ScriptMessage("Script complete." + result);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void ReplaceTiles()
{
    //Clear Tiles
    ClearAllTiles(); 
    for (int room_counter = 0; room_counter < Data.Rooms.Count; room_counter++)
    {
        //Initialize everything
        int counter = 0;
        string line;
        string display_name = Data.GeneralInfo.DisplayName.Content;
        string game_name = Data.GeneralInfo.Name.Content;
        var skip = false;
        uint tile_id = 0;
        int tile_background = 0;
        uint tile_left = 0;
        uint tile_top = 0;
        uint tile_width = 0;
        uint tile_height = 0;
        int tile_x = 0;
        int tile_y = 0;
        int tile_depth = 0;
        int tile_xscale = 0;
        int tile_yscale = 0;
        decimal tile_alpha = 0;
        int tile_visible_determinant = 0;
        uint tile_blend = 0;
        bool tile_visible = true;

        // Read the file and display it line by line.
        var TilesPath = Path.Combine(Environment.GetEnvironmentVariable("LocalAppData"), game_name + "/" + game_name + "_NEW/" + room_counter.ToString() + ".txt");
        System.IO.StreamReader file = new System.IO.StreamReader(TilesPath);
        while((line = file.ReadLine()) != null)
        {
            var option = (counter % 14);
            try
            {
                if (option == 0)
                {
                    try
                    {
                        Regex digitsOnly = new Regex(@"[^\d]");   
                        string stripped = digitsOnly.Replace(line, "");
                        //ScriptMessage(stripped);
                        tile_id = UInt32.Parse(stripped);
                    }
                    catch
                    {
                        break;
                    }
                }
                if (option == 1)
                {
                    tile_background = Int32.Parse(line);
                    if (tile_background == -1)
                        skip = true;
                }
                if (option == 2)
                    tile_left = UInt32.Parse(line);
                if (option == 3)
                    tile_top = UInt32.Parse(line);
                if (option == 4)
                    tile_width = UInt32.Parse(line);
                if (option == 5)
                    tile_height = UInt32.Parse(line);
                if (option == 6)
                    tile_x = Int32.Parse(line);
                if (option == 7)
                    tile_y = Int32.Parse(line);
                if (option == 8)
                    tile_depth = Int32.Parse(line);
                if (option == 9)
                    tile_xscale = Int32.Parse(line);
                if (option == 10)
                    tile_yscale = Int32.Parse(line);
                if (option == 11)
                    tile_alpha = Decimal.Parse(line);
                if (option == 12)
				{
					uint uintValue = Decimal.ToUInt32(Math.Ceiling(255 * tile_alpha));
					string hexValue = uintValue.ToString("X2");
					hexValue = hexValue + "000000";
					uint uintAgain = uint.Parse(hexValue, System.Globalization.NumberStyles.HexNumber);
                    tile_blend = UInt32.Parse(line) + uintAgain;
                }
				if (option == 13)
                {
                    tile_visible_determinant = Int32.Parse(line);
                    if (tile_visible_determinant == 1)
                        tile_visible = true;
                    else if (tile_visible_determinant == 0)
                        tile_visible = false;
                    if (skip == false)
                    {
                        if (Data.GeneralInfo.Major < 2) // Undertale PC (GMS1)
                        {
                            Data.Rooms[room_counter].Tiles.Add(new UndertaleRoom.Tile()
                            {
                                InstanceID = tile_id,
                                BackgroundDefinition = Data.Backgrounds[tile_background],
                                X = tile_x, 
                                Y = tile_y,
                                SourceX = tile_left, 
                                SourceY = tile_top, 
                                Width = tile_width, 
                                Height = tile_height,
                                TileDepth = tile_depth,
                                ScaleX = tile_xscale,
                                ScaleY = tile_yscale,
                                Color = tile_blend
                            });
                        }
                        else
                        {
                            MakeNewTile_GMS2(room_counter, tile_depth, tile_x, tile_y, tile_xscale, tile_yscale, tile_blend, tile_visible, tile_background, tile_left, tile_top, tile_width, tile_height);
                        }
                    }
                }
                counter++;
            }
            catch
			{
                ScriptMessage("Please send Grossley#2869 a screenshot of this message\r\nERROR IN THE FOLLOWING: \r\nRoom: " + room_counter.ToString() + "\r\nLine No: " + (counter+1).ToString() + "\r\nLine: " + line + "\r\nOption: " + option);
			}
        }
        file.Close();
        UpdateProgress();
    }
}

void ClearAllTiles()
{
    for (int room_counter = 0; room_counter < Data.Rooms.Count; room_counter++)
    {
        // Write Tiles
        List<UndertaleRoom.Tile> tiles = GetTiles(Data.Rooms[room_counter]);
        if (tiles.Count > 0)
        {
            foreach (var tile in tiles)
            {
                tile.ObjectDefinition = null;
                if (Data.GeneralInfo.Major < 2) // Undertale PC (GMS1)
                {
                    Data.Rooms[room_counter].Tiles.Remove(tile);
                }
                else //GMS2
                {
                    foreach (var layer in Data.Rooms[room_counter].Layers)
                        if (layer.AssetsData != null)
                            layer.AssetsData.LegacyTiles.Remove(tile);
                }
            }
        }
    }
}

List<UndertaleRoom.Tile> GetTiles(UndertaleRoom room)
{
    List<UndertaleRoom.Tile> tiles = new List<UndertaleRoom.Tile>();
    
    // Add normal tiles.
    foreach (var tile in room.Tiles)
        tiles.Add(tile);
    
    // Add Legacy Tiles from GMS2.
    foreach (UndertaleRoom.Layer layer in room.Layers)
    {
        if (layer.LayerType != UndertaleRoom.LayerType.Assets)
            continue;
        
        UndertaleRoom.Layer.LayerAssetsData assetsData = layer.AssetsData;
        foreach (UndertaleRoom.Tile tile in assetsData.LegacyTiles)
            tiles.Add(tile);
    }
    
    return tiles;
}

void MakeNewTile_GMS2(int room, int depth, int new_tile_x, int new_tile_y, int new_tile_scale_x, int new_tile_scale_y, uint new_color, bool visibility, int sprite_id, uint SourceX_NEW, uint SourceY_NEW, uint NEW_Width, uint NEW_Height) {
    bool pre_existing_layer = false;
    var room_new_tiles = Data.Rooms[room];
    var layer_counter = 0;
    var layer_to_use = 0;
    // create a new asset layer in room_new_tiles
    
    foreach (UndertaleRoom.Layer layer in room_new_tiles.Layers)
    {
        if (layer.LayerName.Content == "Compatibility_Tiles_Depth_" + depth.ToString())
        {
            pre_existing_layer = true;
            layer_to_use = layer_counter;
            break;
        }
        layer_counter += 1;
    }

    uint HighestLayerID = 0;
    for (int room_counter = 1; room_counter < Data.Rooms.Count; room_counter++)
    {
        var room2 = Data.Rooms[room_counter];
        foreach (UndertaleRoom.Layer layer in room2.Layers) {
            if (layer.LayerId > HighestLayerID)
                HighestLayerID = layer.LayerId;
        }
    }

    if (pre_existing_layer == false)
    {
        layer_to_use = layer_counter;
        room_new_tiles.Layers.Add(new UndertaleRoom.Layer()
        {
            LayerName = Data.Strings.MakeString("Compatibility_Tiles_Depth_" + depth.ToString()),
            LayerId = HighestLayerID + 1, // make sure this is always +1 of the last layer in the last room
            Data = new UndertaleRoom.Layer.LayerAssetsData(),
            LayerType = UndertaleRoom.LayerType.Assets,
            LayerDepth = depth,
            IsVisible = visibility
        });
    }
    
    // create a new pointer list
    if (room_new_tiles.Layers[layer_to_use].AssetsData.LegacyTiles == null)
        room_new_tiles.Layers[layer_to_use].AssetsData.LegacyTiles = new UndertalePointerList<UndertaleRoom.Tile>();
    // create new sprite pointer list
    if (room_new_tiles.Layers[layer_to_use].AssetsData.Sprites == null)
        room_new_tiles.Layers[layer_to_use].AssetsData.Sprites = new UndertalePointerList<UndertaleRoom.SpriteInstance>();
    // add a new tile to this list
    room_new_tiles.Layers[layer_to_use].AssetsData.LegacyTiles.Add(new UndertaleRoom.Tile 
    {
        spriteMode = true,
        X = new_tile_x,
        Y = new_tile_y,
        SpriteDefinition = Data.Sprites[sprite_id],
        ObjectDefinition = Data.Sprites[sprite_id],
        SourceX = SourceX_NEW,
        SourceY = SourceY_NEW,
        Width = NEW_Width,
        Height = NEW_Height,
        TileDepth = depth,
        InstanceID = Data.GeneralInfo.LastTile++,
        ScaleX = new_tile_scale_x,
        ScaleY = new_tile_scale_y,
        Color = new_color
    });
}

void UpdateProgress()
{
    UpdateProgressBar(null, "Rooms", progress++, Data.Rooms.Count);
}

void AddTheGML(string importFolder)
{
    // Check code directory.
    if (importFolder == null)
        throw new System.Exception("The import folder was not set.");

    // Ask whether they want to link code. If no, will only generate code entry.
    // If yes, will try to add code to objects and scripts depending upon its name
    bool doParse = true;

    int progress = 0;
    string[] dirFiles = Directory.GetFiles(importFolder);
    foreach (string file in dirFiles) 
    {
        UpdateProgressBar(null, "Files", progress++, dirFiles.Length);

        string fileName = Path.GetFileName(file);
        if (!fileName.EndsWith(".gml") || !fileName.Contains("_")) // Perhaps drop the underscore check?
            continue; // Restarts loop if file is not a valid code asset.
        if (fileName.EndsWith("PreCreate_0.gml") && (Data.GeneralInfo.Major < 2))
            continue; // Restarts loop if file is not a valid code asset.

        string gmlCode = File.ReadAllText(file);
        string codeName = Path.GetFileNameWithoutExtension(file);
        if (Data.Code.ByName(codeName) == null) // Should keep from adding duplicate scripts; haven't tested
        {
            UndertaleCode code = new UndertaleCode();
            code.Name = Data.Strings.MakeString(codeName);
            Data.Code.Add(code);

            UndertaleCodeLocals locals = new UndertaleCodeLocals();
            locals.Name = code.Name;

            UndertaleCodeLocals.LocalVar argsLocal = new UndertaleCodeLocals.LocalVar();
            argsLocal.Name = Data.Strings.MakeString("arguments");
            argsLocal.Index = 0;

            locals.Locals.Add(argsLocal);

            code.LocalsCount = 1;
            code.GenerateLocalVarDefinitions(code.FindReferencedLocalVars(), locals); // Dunno if we actually need this line, but it seems to work?
            Data.CodeLocals.Add(locals);

            if (doParse)
            {
                // This portion links code.
                if (codeName.Substring(0, 10).Equals("gml_Script")) 
                {
                    // Add code to scripts section.
                    if (Data.Scripts.ByName(codeName.Substring(11)) == null)
                    {
                        UndertaleScript scr = new UndertaleScript();
                        scr.Name = Data.Strings.MakeString(codeName.Substring(11));
                        scr.Code = code;
                        Data.Scripts.Add(scr);
                    }
                    else
                    {
                        UndertaleScript scr = Data.Scripts.ByName(codeName.Substring(11));
                        scr.Code = code;
                    }
                }
                else if (codeName.Substring(0, 10).Equals("gml_Object"))
                {
                    // Add code to object methods.
                    string afterPrefix = codeName.Substring(11);
                    // Dumb substring stuff, don't mess with this.
                    int underCount = 0;
                    string methodNumberStr = "", methodName = "", objName = "";
                    for (int i = afterPrefix.Length - 1; i >= 0; i--) 
                    {
                        if (afterPrefix[i] == '_') 
                        {
                            underCount++;
                            if (underCount == 1) 
                            {
                                methodNumberStr = afterPrefix.Substring(i + 1);
                            } else if (underCount == 2)
                            {
                                objName = afterPrefix.Substring(0, i);
                                methodName = afterPrefix.Substring(i + 1, afterPrefix.Length - objName.Length - methodNumberStr.Length - 2);
                                break;
                            }
                        }
                    }

                    int methodNumber = Int32.Parse(methodNumberStr);
                    UndertaleGameObject obj = Data.GameObjects.ByName(objName);
                    if (obj == null) 
                    {
                        bool doNewObj = ScriptQuestion("Object " + objName + " was not found.\nAdd new object called " + objName + "?");
                        if (doNewObj) 
                        {
                            UndertaleGameObject gameObj = new UndertaleGameObject();
                            gameObj.Name = Data.Strings.MakeString(objName);
                            Data.GameObjects.Add(gameObj);
                        } else 
                        {
                            try
                            {
                                Data.Code.ByName(codeName).ReplaceGML(gmlCode, Data);
                            }
                            catch
                            {
                                throw new System.Exception(codeName + " has an error");
                            }
                            continue;
                        }
                    }

                    obj = Data.GameObjects.ByName(objName);
                    int eventIdx = (int)Enum.Parse(typeof(EventTypes), methodName);

                    UndertalePointerList<UndertaleGameObject.Event> eventList = obj.Events[eventIdx];
                    UndertaleGameObject.EventAction action = new UndertaleGameObject.EventAction();
                    UndertaleGameObject.Event evnt = new UndertaleGameObject.Event();

                    action.ActionName = code.Name;
                    action.CodeId = code;
                    evnt.EventSubtype = (uint)methodNumber;
                    evnt.Actions.Add(action);
                    eventList.Add(evnt);
                }
                // Code which does not match these criteria cannot link, but are still added to the code section.
            }
        }
        try
        {
            Data.Code.ByName(codeName).ReplaceGML(gmlCode, Data);
        }
        catch
        {
            throw new System.Exception(codeName + " has an error");
        }
    }

    HideProgressBar();
}

enum EventTypes 
{
    Create,
    Destroy,
    Alarm,
    Step,
    Collision,
    Keyboard,
    Mouse,
    Other,
    Draw,
    KeyPress,
    KeyRelease,
    Gesture,
    Asynchronous,
    PreCreate
}

void SetUpTileEditor()
{
    ScriptMessage("Please select where the Tile Editor GML files are.");
    string importFolder = PromptChooseDirectory("Import From Where");
    AddTheGML(importFolder);
    AddTheGML(importFolder);
    ScriptMessage("All files successfully imported.");
    EnsureDataLoaded();
    ScriptMessage("Implement tile editor");
    var code = Data.GameObjects.ByName("obj_time");
    code.EventHandlerFor(EventType.Create, Data.Strings, Data.Code, Data.CodeLocals).AppendGML(@"
scr_tile_editor_init()
    ", Data);

    var code1 = Data.Code.ByName("gml_Object_obj_time_Step_1");
    code1.AppendGML(@"
scr_tile_editor_room_parse()
scr_debug_tile_editor()
    ", Data);

    var code5 = Data.GameObjects.ByName("obj_time").EventHandlerFor(EventType.Draw, EventSubtypeDraw.DrawGUI, Data.Strings, Data.Code, Data.CodeLocals);
    code5.AppendGML(@"
scr_tile_editor_gui()
    ", Data);

    var code6 = Data.GameObjects.ByName("obj_time").EventHandlerFor(EventType.Draw, EventSubtypeDraw.Draw, Data.Strings, Data.Code, Data.CodeLocals);
    code6.AppendGML(@"
scr_tile_editor_draw()
    ", Data);

    var code3 = Data.GameObjects.ByName("obj_time").EventHandlerFor(EventType.Other, EventSubtypeOther.RoomStart, Data.Strings, Data.Code, Data.CodeLocals);
    code3.AppendGML(@"
scr_tile_editor_room_start()
    ", Data);

    var code4 = Data.GameObjects.ByName("obj_time").EventHandlerFor(EventType.Other, EventSubtypeOther.RoomEnd, Data.Strings, Data.Code, Data.CodeLocals);
    code4.ReplaceGML(@"
scr_tile_editor_room_end()
    ", Data);

    ChangeSelection(code4);
    ScriptMessage("Tile editor added.");
}