extends Sprite2D

var velocity : Vector2 = Vector2(1,0)
var speed : int = 250
var look_once : bool = true

var attack_damage : float = 10.0
var knockback_force : float = 100.0

func _physics_aprocess(delta) -> void:
	if look_once:
		look_at(get_global_mouse_position())
		look_once = false
	global_position += velocity.rotated(rotation) * speed * delta
	
func _ready() -> void:
	$despawn.start()

func _on_despawn_timeout() -> void:
	queue_free()

func _on_hitbox_area_entered(area: Area2D) -> void:
	print(area.name)
	if area is HitboxComponenent and area.name == "enemycubehitbox":
		var hitbox : HitboxComponenent = area
		var attack = Attack.new()
		attack.attack_damage = attack_damage
		attack.knockback_force = knockback_force
		attack.attack_position = global_position
		hitbox.damage(attack)
	queue_free()
