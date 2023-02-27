global.damage = 9999999
global.pwr = 99999
global.wstrength = 99999
if object_exists(asset_get_index("obj_flowey_master"))
{
    if instance_exists(asset_get_index("obj_flowey_master"))
    {
        with (asset_get_index("obj_flowey_master"))
            megadamage = 8
    }
} 
global.floweyhp = 1
