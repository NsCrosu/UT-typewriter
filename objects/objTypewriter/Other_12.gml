/// @desc Execute Commands
var command = list_command;

switch(command[|0]){
	case "speed":
		command[|1] = real(command[|1]);
		if(command[|1] >= 0){
			type_speed = command[|1];
		}
		break;
		
	case "color":
	case "colour":
	case "col":
		var str2col = function(string){
			var color;
			switch(string){
				case "white":
				case "clear":   color = ca.white;  break;
				case "black":   color = ca.black;  break;
				case "green":   color = ca.green;  break;
				case "aqua":
				case "cyan":    color = ca.aqua;   break;
				case "blue":    color = ca.blue;   break;
				case "purple":  color = ca.pink;   break;
				case "pink":
				case "fuchsia": color = ca.pink;   break;
				case "red":     color = ca.red;    break;
				case "orange":  color = ca.orange  break;
				case "yellow":  color = ca.yellow; break;
			}
			return color;
		}
		col = str2col(command[|1]);
		break;
	
	case "alpha":
		command[|1] = real(command[|1]);
		alpha = command[|1];
		break;
	case "wait":
		command[|1] = real(command[|1]);
		if(command[|1] >= 0){
			wait = command[|1];
		}else{
			wait = 0;
			if(textCommandShowError){
				show_debug_message("错误, 非法\"wait\"数值.请确保值为非负数\nERROR! Illegal \"wait\" value. Please make sure the value is non-negative.\n");
			}
		}
		break;
	case "pause":
		paused = true;
		wait = 0;
		char_per_time = 0;
		break;
	case "zable":
		zable = bool(command[|1]);
		break;
	case "xable":
		xable = bool(command[|1]);
		break;
	case "font":
		if(command[|1] != "auto"){
			font = asset_get_index(command[|1]);
		}else{
			font = "auto";
		}
		edited = true;
		break;
	case "sound":
	case "voice":
		sound = asset_get_index(command[|1]);
		edited = true;
		break;
	case "clear":
		textClear;
		break;
	case "scale":
		command[|1] = real(command[|1]);
		xscale = command[|1];
		yscale = command[|1];
		edited = true;
		break;
	case "xscale":
		command[|1] = real(command[|1]);
		xscale = command[|1];
		edited = true;
		break;
	case "yscale":
		command[|1] = real(command[|1]);
		yscale = command[|1];
		edited = true;
		break;
	case "xspace":
		command[|1] = real(command[|1]);
		xspace = command[|1];
		edited = true;
		break;
	case "yspace":
		command[|1] = real(command[|1]);
		yspace = command[|1];
		edited = true;
		break;
	case "insert":
	case "paste":
		text = string_insert(command[|1], text, char_i + 1);
		break;
	case "effect":
		command[|1] = real(command[|1]);
		effect = command[|1];
		edited = true;
		break;
	case "depth":
		command[|1] = real(command[|1]);
		depth = command[|1];
		break;
	case "script":
	case "scr":
		var target = -1;
		if(is_real(command[|1])){
			target = command[|1];
		}else{
			target = asset_get_index(command[|1]);
		}
		if(script_exists(target)){
			switch(ds_list_size(command) - 2){
				case 0:
					script_execute(target);
					break;
				case 1:
					script_execute(target, command[|2]);
					break;
				case 2:
					script_execute(target, command[|2], command[|3]);
					break;
				case 3:
					script_execute(target, command[|2], command[|3], command[|4]);
					break;
				case 4:
					script_execute(target, command[|2], command[|3], command[|4], command[|5]);
					break;
				case 5:
					script_execute(target, command[|2], command[|3], command[|4], command[|5], command[|6]);
					break;
				case 6:
					script_execute(target, command[|2], command[|3], command[|4], command[|5], command[|6], command[|7]);
					break;
				case 7:
					script_execute(target, command[|2], command[|3], command[|4], command[|5], command[|6], command[|7], command[|8]);
					break;
				case 8:
					script_execute(target, command[|2], command[|3], command[|4], command[|5], command[|6], command[|7], command[|8], command[|9]);
					break;
				case 9:
					script_execute(target, command[|2], command[|3], command[|4], command[|5], command[|6], command[|7], command[|8], command[|9], command[|10]);
					break;
				case 10:
					script_execute(target, command[|2], command[|3], command[|4], command[|5], command[|6], command[|7], command[|8], command[|9], command[|10], command[|11]);
					break;
				case 11:
					script_execute(target, command[|2], command[|3], command[|4], command[|5], command[|6], command[|7], command[|8], command[|9], command[|10], command[|11], command[|12]);
					break;
				case 12:
					script_execute(target, command[|2], command[|3], command[|4], command[|5], command[|6], command[|7], command[|8], command[|9], command[|10], command[|11], command[|12], command[|13]);
					break;
				case 13:
					script_execute(target, command[|2], command[|3], command[|4], command[|5], command[|6], command[|7], command[|8], command[|9], command[|10], command[|11], command[|12], command[|13], command[|14]);
					break;
				case 14:
					script_execute(target, command[|2], command[|3], command[|4], command[|5], command[|6], command[|7], command[|8], command[|9], command[|10], command[|11], command[|12], command[|13], command[|14], command[|15]);
					break;
				case 15:
					script_execute(target, command[|2], command[|3], command[|4], command[|5], command[|6], command[|7], command[|8], command[|9], command[|10], command[|11], command[|12], command[|13], command[|14], command[|15], command[|16]);
					break;
			}
		}
	break;
}
