extends Node2D
var mob_count = 0
var rounds = Global.rounds
var soap_boss_packed = preload("res://boss_mobs/Soap/Boss_Soap.tscn")

func spawn_mob():
	var new_mob = preload("res://enemy_mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func spawn_soap_boss():
	var soap_boss = soap_boss_packed.instantiate()
	%PathFollow2D.progress_ratio = randf()
	soap_boss.global_position = %PathFollow2D.global_position
	add_child(soap_boss)

func _on_enemy_spawner_timer_timeout() -> void:
	print($Enemy_spawner_timer.wait_time)
	if rounds == 40:
		Global.boss_alive4 = true
		spawn_soap_boss()
	var i = 0
	if rounds == 1:
		while i < 5: 
			i += 1
			spawn_mob()
	rounds += 1
	if 2 <= rounds and rounds < 11 and Global.boss_alive4 == false:
		while i < (rounds * 4 + 5):
			i += 1
			spawn_mob()
		$Enemy_spawner_timer.wait_time -= $Enemy_spawner_timer.wait_time * 0.05
	if rounds > 10 and Global.boss_alive4 == false:
		while i < (rounds * 4 + 5):
			i += 1
			spawn_mob()
