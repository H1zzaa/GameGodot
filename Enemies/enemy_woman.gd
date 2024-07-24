extends CharacterBody2D
class_name EnemyWomanan

@onready var sprite_enemy_woman: Sprite2D = $Sprite2D

var speed = 100
var health = 20
var dead = false
var player_in_area = false
var player_in_attack_area = false
var player
var enemy_direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	dead = false

func _process(delta: float) -> void:
	if $AnimationEnemyWoman.current_animation == "Punch":
		return
	
	move_to_player()

func _physics_process(delta: float) -> void:
	move_and_slide()

func move_to_player():
	if not dead:
		$DetectionPlayerArea/Detection.disabled = false
		$AttackDetectionCollision/AttackDetection.disabled = false
		$AttackCollision/Attack.disabled = false
		if player_in_area:
			if player.position.x - position.x < 0:
				get_node("AttackDetectionCollision").set_scale(Vector2(-1,1))
				get_node("AttackCollision").set_scale(Vector2(-1,1))
				position.x += (player.position.x - position.x) / speed
				sprite_enemy_woman.flip_h = true
				$AnimationEnemyWoman.play("Walk")
			elif player.position.x - position.x > 0:
				get_node("AttackDetectionCollision").set_scale(Vector2(1,1))
				get_node("AttackCollision").set_scale(Vector2(1,1))
				position.x += (player.position.x - position.x) / speed
				sprite_enemy_woman.flip_h = false
				$AnimationEnemyWoman.play("Walk")
		else:
			sprite_enemy_woman.flip_h = false
			$AnimationEnemyWoman.play("Idle")
	if dead:
		$DetectionPlayerArea/Detection.disabled = true
		$AttackDetectionCollision/AttackDetection.disabled = true
		$AttackCollision/Attack.disabled = true

func _on_detection_player_area_body_entered(body: PhysicsBody2D) -> void:
	if body.has_method("player_detection_area"):
		player_in_area = true
		player = body

func _on_detection_player_area_body_exited(body: PhysicsBody2D) -> void:
	if body.has_method("player_detection_area"):
		player_in_area = false

func _on_attack_detection_collision_body_entered(body: Node2D) -> void:
	$AnimationEnemyWoman.play("Punch")

func _on_attack_collision_body_entered(body: Node2D) -> void:
	player.player_death()

func punch():
	$EnemyPunch.play()
	$AttackCollision.monitoring = true

func end_punching():
	$AttackCollision.monitoring = false

func _on_hit_box_area_entered(area: Area2D) -> void:
	var damage: int
	if area.has_method("sword_deal_damage"):
		damage = 10
		take_damage(damage)

func take_damage(damage: int):
	health -= damage
	print_debug("-10 hp woman")
	$EnemyDamaged.play()
	if health <= 0 and not dead:
		death()

func death():
	dead = true
	$AnimationEnemyWoman.play("Death")
	await get_tree().create_timer(1).timeout
	queue_free()
