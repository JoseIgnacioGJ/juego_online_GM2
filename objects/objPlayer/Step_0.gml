input.hor = keyboard_check(vk_right) - keyboard_check(vk_left);

if (input.hor != 0) {
	x += sign(input.hor) * 3;
	image_xscale = sign(input.hor);
	sprite_index = sprPlayerRun;
} else {
	sprite_index = sprPlayerIdle;
}