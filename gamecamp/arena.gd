extends Node2D

var enemy_1 = preload("res://enemy_mob.tscn")

func _ready():
	Global.node_creation_parent = self
	Global.points = 0

func _exit_tree():
	Global.node_creation_parent = null



func _on_enemy_spawner_timer_timeout() -> void:
	var enemy_position = Vector2(randf_range(-120, 1250), randf_range(-90, 690))
	
	while enemy_position.x < 1200 and enemy_position > -80 and enemy_position.y < 670 and enemy_position.y > -30:
		enemy_position = Vector2(randf_range(-120, 1250), randf_range(-90, 690))
	Global.instance_node(enemy_1, enemy_position, self)
	

func _on_difficulty_timer_timeout() -> void:
	if $Enemy_spawner_timer.wait_time > 0.5:
		$Enemy_spawner_timer.wait_time -= 1
