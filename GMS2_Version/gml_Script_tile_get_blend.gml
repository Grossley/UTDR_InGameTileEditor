var __index = argument0
temp_value = layer_tile_get_blend(__index)
if (temp_value > 16777215)
    temp_value = 16777215
if (temp_value < 0)
    temp_value = 0
return temp_value;
