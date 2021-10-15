extends Node

var ship_statistics : Resource

func load_statistics(ship_name : String):
	var stat_path = "res://Player/Statistics/"  + ship_name  + ".tres"
	
	ship_statistics = load(stat_path)
