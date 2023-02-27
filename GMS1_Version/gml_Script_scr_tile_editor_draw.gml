if (turn_off_text_for_Shesez == false && (1 == 1))
{
    draw_set_colour(c_red) 
    if (!(tilex_tl == tiley_tl && tiley_tl == tilex_br && tilex_br == tiley_br && (tiley_br == 1 || tiley_br == 0 || tiley_br == -1)))
        draw_rectangle(tilex_tl, tiley_tl, tilex_br, tiley_br, true)
    tilex_tl = -1
    tiley_tl = -1
    tilex_br = -1
    tiley_br = -1
}