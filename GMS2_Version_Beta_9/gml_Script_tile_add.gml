var __back = argument0
var __left = argument1
var __top = argument2
var __width = argument3
var __height = argument4
var __x = argument5
var __y = argument6
var __depth = argument7
var __layers = layer_get_all()
var __numlayers = array_length_1d(__layers)
var __layertouse = -1
var __i = 0
while (__i < __numlayers)
{
    if (layer_get_depth(__layers[__i]) == __depth)
    {
        __layertouse = __layers[__i]
        break
    }
    else
    {
        __i++
        continue
    }
}
if (__layertouse == -1)
    __layertouse = layer_create(__depth)
var __tile = layer_tile_create(__layertouse, __x, __y, __back, __left, __top, __width, __height)
return __tile;
