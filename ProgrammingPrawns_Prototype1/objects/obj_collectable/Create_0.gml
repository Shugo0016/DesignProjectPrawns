/// @description Insert description here
// You can write your code in this editor
variable_type = choose("int","string","bool","float");
curr_x = x;
curr_y = y;
base_speed = 3;
mynum = 0;


if variable_type = "int" { 
	num = irandom(300)
	my_type_data = string(num);
}
else if variable_type = "string" {
	    my_type_data = choose(chr(34)+"joe"+chr(34),chr(34)+"hello world"+chr(34),chr(34)+"true"+chr(34),chr(34)+"false"+chr(34),chr(34)+"Awesome"+chr(34),chr(34)+"4000"+chr(34));
		
}
else if variable_type = "bool" { 
	    
		my_type_data = choose("true","false");
}
else if variable_type = "float" { 
		num = random_range(0,300)
		my_type_data = string(num);
}
	