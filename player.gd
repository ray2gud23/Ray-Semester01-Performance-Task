extends Area2D

@export var speed = 5


@onready var b_gmusic = %BGmusic

@onready var enemy_hit = %EnemyHit



func _ready():
	pass # Replace with function body.



func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		velocity.y += -1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_left"):
		velocity.x += -1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		
		
	if velocity.length() > 0:
		velocity.normalized() * delta
		
	position += velocity * speed


func _on_body_entered(body):
	hide()
	b_gmusic.stop()
	enemy_hit.play()
