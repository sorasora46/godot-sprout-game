extends Area2D

@onready var game_managers: Node = %GameManagers

func _on_body_entered(body: Node2D) -> void:
	game_managers.add_score()
	queue_free()
