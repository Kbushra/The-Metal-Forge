y += 0.2;
image_alpha -= 0.02;

draw_set_colour(amt < 0 ? c_red : c_green);
draw_set_alpha(image_alpha);
draw_set_halign(fa_right);
draw_text(x, y, amt);

draw_reset();