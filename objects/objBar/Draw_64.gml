draw_set_colour(bg);
draw_rectangle(x - sprite_width, y - sprite_height/2, x, y + sprite_height/2, false);

var offset = hp/maxHp <= 0.02 || hp/maxHp >= 0.98 ? 0 : 0.01;
draw_set_colour(c_white);
draw_rectangle(x - sprite_width * (highlight + offset), y - sprite_height/2, x, y + sprite_height/2, false);

draw_set_colour(fg);
draw_rectangle(x - sprite_width * shownHp/maxHp, y - sprite_height/2, x, y + sprite_height/2, false);

draw_set_colour(c_white);

draw_set_halign(fa_right)
draw_set_valign(fa_center);
draw_text(x - 5, y, name);

draw_reset();

draw_self();