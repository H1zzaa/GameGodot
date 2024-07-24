extends Node2D

var enemy_man_preload = preload("res://Enemies/enemy_man.tscn")

func _ready() -> void:
	$FansAnimation0.play("Fans")
	$FansAnimation0/Fans1.play("Fans")
	$FansAnimation0/Fans2.play("Fans")
	$FansAnimation0/Fans3.play("Fans")
	await get_tree().create_timer(0.5).timeout
	$FansAnimation0/Fans4Back.play("Fans")
	$FansAnimation0/Fans5Back.play("Fans")
	$FansAnimation0/Fans6Back.play("Fans")
	$FansAnimation0/Fans7Back.play("Fans")

func _process(delta: float) -> void:
	pass

func _on_spawn_enemy_man_timer_timeout() -> void:
	pass
#	var enemy_man = enemy_man_preload.instance()
#	enemy_man.position = Vector2(589, 174)
#	add_child(enemy_man)
