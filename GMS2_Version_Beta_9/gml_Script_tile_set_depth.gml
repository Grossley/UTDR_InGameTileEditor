var __index = argument0
var __depth = argument1
var __layerid = layer_get_element_layer(__index)
if (__layerid == -1)
    return -1;
var __currdepth = layer_get_depth(__layerid)
if (__currdepth == __depth)
    return -1;
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
layer_element_move(__index, __layertouse)
return layer_get_depth(__layerid);
