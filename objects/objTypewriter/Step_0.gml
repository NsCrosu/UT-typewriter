if(paused && zable && keyboard_check_pressed(vk_enter)){
	paused = false;
	type_speed = 1;
	char_per_time = 1;
}
if(xable && keyboard_check_pressed(vk_shift)){
	wait = 0;
	type_speed = -1;
	char_per_time = 0;
}

if(char_i < (string_length(text) + 1)){
	if(!paused){
		if(wait > 0){
			wait--;
		}else{
			if(char_per_time > 0){
				char_per_time--;
			}else{
				do{
					repeat(char_per_frame){
						while((string_char_at(text, char_i) == textTagReturn || string_char_at(text, char_i) == textCommandTagOpen || string_char_at(text, char_i) == " ") && (wait == 0 || type_speed == -1) && !paused && char_i <= string_length(text)){
							while((string_char_at(text, char_i) == textCommandTagOpen) && (wait == 0 || type_speed == -1) && !paused && char_i <= string_length(text)){
								textCharMoveNext;
								ds_list_clear(list_command);
								var command = "";
								var loop = true;
								while((char_i <= string_length(text)) && loop){
									var command_char = string_char_at(text, char_i);
									if(command_char == textCommandTagBreak || command_char == textCommandTagClose){
										if(!ds_list_empty(list_command)){
											if(command == "true"){command = true;}
											if(command == "false"){command = false;}
											//try{
											//	command = real(command);
											//}catch(_){
											//	if(textCommandShowError){
											//			show_debug_message("错误, 给定的指令参数\"" + string(command) + "\"无法被解释\nERROR! The given command parameter \"" + string(command) + "\" could not be executed.\n");
											//		show_debug_message("给定的指令\"" + string(command) + "\"不是real类型, 跳过转换类型");
											//	}
											//}
										}
										ds_list_add(list_command, command);
										command = "";
									}else{
										if(command_char == "\\"){
											textCharMoveNext;
											command_char = string_char_at(text, char_i);
										}
										command += command_char;
									}
									if(string_char_at(text, char_i) == textCommandTagClose){
										textCommandExecute;
										loop = false;
									}
									textCharMoveNext;
								}
								//if(loop && textCommandShowError){
								//	show_debug_message("在解释打字机指令时出现未知的错误\nTexttyper Command Execution Error.\n");
								//}
							}
							while((string_char_at(text, char_i) == textTagReturn) && (wait == 0 || type_speed == -1) && !paused && char_i <= string_length(text)){
								textNewLine;
								textCharMoveNext;
							}
							while((string_char_at(text, char_i) == " ") && (wait == 0 || type_speed == -1) && !paused && char_i <= string_length(text)){
								char = " ";
								textType;
								textCharMoveNext;
							}
						}
						if((wait == 0 || type_speed == -1) && !paused && char_i <= string_length(text)){
							char = string_char_at(text, char_i);
							if(char == "\\"){
								textCharMoveNext;
								char = string_char_at(text, char_i);
							}
							textType;
							char_per_time = type_speed;
							textCharMoveNext;
						}
					}
				}until(char_i > string_length(text) || paused || type_speed != -1);
			}
		}	
	}
}else{
	if(zable && keyboard_check_pressed(vk_enter)){
		instance_destroy();
	}
}
