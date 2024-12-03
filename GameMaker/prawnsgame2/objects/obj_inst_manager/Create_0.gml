/// @description Insert description here
// You can write your code in this editor/
error_message = ""
global.instructions = array_create(3);

//make type 1 instructions
push = instance_create_depth(x,y,-1,obj_inst1);
push.instruction = "push"
push.sprite_index = spr_push

pop = instance_create_depth(x+200,y,-1,obj_inst1);
pop.instruction = "pop"
pop.sprite_index = spr_pop

//insert = instance_create_depth(x+200,y+200,-1,obj_inst1);
//insert.instruction = "insert"
//insert.sprite_index = spr_insert

rev = instance_create_depth(x,y+200,-1,obj_inst1);
rev.instruction = "rev"
rev.sprite_index = spr_rev

//make obj inst 2 fruits
orange = instance_create_depth(575,410,-1,obj_inst2);
orange.instruction = "orange"
orange.sprite_index = spr_orange

apple = instance_create_depth(575,500,-1,obj_inst2);
apple.instruction = "apple"
apple.sprite_index = spr_apple


banana = instance_create_depth(575,590,-1,obj_inst2);
banana.instruction = "banana"
banana.sprite_index = spr_banana