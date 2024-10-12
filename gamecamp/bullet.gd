extends Sprite2D


var velocity = Vector2(1, 0)
var speed = 400
var look_once = true

func _process(delta):
	if look_once == true:
		look_at(get_global_mouse_position())
		look_once = false
		
	global_position += velocity.rotated(rotation) * speed * delta


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
