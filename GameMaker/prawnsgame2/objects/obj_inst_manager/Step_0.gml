/// @description Insert description here
// You can write your code in this editor

if obj_check.clicked {
	error_message = ""
	var in1 = array_get(global.instructions,0);
	var in2 = array_get(global.instructions,1);
	var in3 = array_get(global.instructions,2);
	
	//push pop rev insert
	
	if (in1.instruction == "pop") {
		if in2 == 0 {
		var n = array_pop(global.my_array);
		array_pop(global.string_array);
		instance_destroy(n)
		}
		else {
			error_message = "POP doesn't require input"
		}
		
		
	}
	else if (in1.instruction == "rev") {
		if in2 == 0 {
			global.my_array = array_reverse(global.my_array)
			global.string_array = array_reverse(global.string_array);
		}
		else {
			error_message = "REV doesn't require input"
		}
		
	}
	else if (in1.instruction == "push") {
		if (in2 != 0) {
			array_push(global.string_array, in2.instruction)
			var item = instance_create_depth(obj_array_manager.x,obj_array_manager.y,0,obj_item)
			item.instruction = in2.instruction
			item.sprite_index = in2.sprite_index
			array_push(global.my_array,item)
		}
		else {
			error_message = "PUSH requires 1 fruit input"
		}
	}
	
	

	obj_check.clicked = false;
}
