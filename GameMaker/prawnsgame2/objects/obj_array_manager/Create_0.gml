/// @description Insert description here
// You can write your code in this editor
global.num_items = 5;
global.array_length = global.num_items;
global.my_array = array_create(0); //array of items for displaying
global.string_array = array_create(0);



//ROOM 1
//Give player: Apple Banana Orange Apple
//Goal Array: Apple Banana Orange
//	var curr = instance_create_depth(x,y,0,obj_item);
//	curr.position_in_array = i + 1;
//	array_push(global.my_array,curr);
//

if room = Room1 {
	item1 = instance_create_depth(x,y,0,obj_item);
	item1.item_type = "apple"
	item1.sprite_index = spr_apple
	array_push(global.my_array,item1)
	array_push(global.string_array,"apple")

	item2 = instance_create_depth(x+50,y,0,obj_item);
	item2.item_type = "banana"
	item2.sprite_index = spr_banana
	array_push(global.my_array,item2)
	array_push(global.string_array,"banana")

	item3 = instance_create_depth(x+100,y,0,obj_item);
	item3.item_type = "orange"
	item3.sprite_index = spr_orange
	array_push(global.my_array,item3)
	array_push(global.string_array,"orange")

	item4 = instance_create_depth(x+150,y,0,obj_item);
	item4.item_type = "apple"
	item4.sprite_index = spr_apple
	array_push(global.my_array,item4)
	array_push(global.string_array,"apple")


	//GOAL ARRAY creation

	global.goal_array = array_create(0);
	array_push(global.goal_array,"apple")
	array_push(global.goal_array,"banana")
	array_push(global.goal_array,"orange")
}
else if room == Room2 {

item2 = instance_create_depth(x+50,y,0,obj_item);
item2.item_type = "orange"
item2.sprite_index = spr_orange
array_push(global.my_array,item2)
array_push(global.string_array,"orange")

item3 = instance_create_depth(x+100,y,0,obj_item);
item3.item_type = "orange"
item3.sprite_index = spr_orange
array_push(global.my_array,item3)
array_push(global.string_array,"orange")


item4 = instance_create_depth(x+150,y,0,obj_item);
item4.item_type = "banana"
item4.sprite_index = spr_banana
array_push(global.my_array,item4)
array_push(global.string_array,"banana")


//GOAL ARRAY creation

global.goal_array = array_create(0);
array_push(global.goal_array,"apple")
array_push(global.goal_array,"orange")
array_push(global.goal_array,"orange")
array_push(global.goal_array,"banana")

}

else if room == Room3 {

item2 = instance_create_depth(x+50,y,0,obj_item);
item2.item_type = "banana"
item2.sprite_index = spr_banana
array_push(global.my_array,item2)
array_push(global.string_array,"banana")

item3 = instance_create_depth(x+100,y,0,obj_item);
item3.item_type = "apple"
item3.sprite_index = spr_apple
array_push(global.my_array,item3)
array_push(global.string_array,"apple")

item4 = instance_create_depth(x+50,y,0,obj_item);
item4.item_type = "banana"
item4.sprite_index = spr_banana
array_push(global.my_array,item4)
array_push(global.string_array,"banana")

item5 = instance_create_depth(x+100,y,0,obj_item);
item5.item_type = "apple"
item5.sprite_index = spr_apple
array_push(global.my_array,item5)
array_push(global.string_array,"apple")

item6 = instance_create_depth(x+100,y,0,obj_item);
	item6.item_type = "orange"
	item6.sprite_index = spr_orange
	array_push(global.my_array,item6)
	array_push(global.string_array,"orange")



//GOAL ARRAY creation

global.goal_array = array_create(0);
array_push(global.goal_array,"orange")
array_push(global.goal_array,"apple")
array_push(global.goal_array,"banana")
array_push(global.goal_array,"apple")

}