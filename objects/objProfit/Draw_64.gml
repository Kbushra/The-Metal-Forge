if room == rmMenu { exit; }

draw_set_halign(fa_right);
draw_text(x, y, $"${profit}");

draw_set_colour( merge_colour(c_red, c_lime, rank_to_num(rank)/5) );
draw_text(x, y + 12, $"{rank} RANK");

draw_set_colour(c_white);
draw_set_halign(fa_left);