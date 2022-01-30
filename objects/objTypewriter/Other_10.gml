/// @desc Type A Single Text
var offset = 0;
var _font = -1;
if(ord(char) >= 0xa0){
	if(font == "auto"){
		_font = textDefaultFontCN;
		sound = textDefaultSound;
		draw_set_font(textDefaultFontCN);
		var _h1 = string_height(" ");
		draw_set_font(textDefaultFontEN);
		var _h2 = string_height(" ");
		offset = abs(_h1 - _h2)/2*yscale;
	}
	if(!edited){
		xscale = 2;
		yscale = 2;
		xspace = 7;
		yspace = 8;
	}
}else{
	if(font == "auto"){
		_font = textDefaultFontEN;
		effect = textDefaultEffect;
	}
	if(!edited){
		xscale = 2;
		yscale = 2;
		xspace = 5;
		yspace = 5;
	}
}

if(char != " "){
	var cr = instance_create_depth(x + char_x, y + char_y + offset, depth, objWord);
	cr.text = char;
	cr.font = (_font == -1) ? font : _font;
	cr.xscale = xscale;
	cr.yscale = yscale;
	cr.col = col;
	cr.angle = angle;
	cr.alpha = alpha;
	cr.effect = effect;
	if(sound >= 0 && type_speed != -1){
		cr.sound = sound;
	}
	ds_list_add(list_words, cr);
}

char_x += string_width(char) + xspace*xscale;
