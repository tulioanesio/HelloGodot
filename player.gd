extends CharacterBody2D

var speed = 300.0
var jump_speed = -500.0
# Pega a gravidade das configuracoes do projeto
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Adiciona a gravidade
	velocity.y += gravity * delta	

	# Controla o pulo (tecla pra cima)
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		$SoundJump.play()
		velocity.y = jump_speed

	# Pega as direções das entradas do teclado (esquerda e direita)
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play()
	elif  direction < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	move_and_slide()
