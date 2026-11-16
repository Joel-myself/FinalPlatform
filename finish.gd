extends Area2D



func _on_body_entered(body: Node2D) -> void:
	print("Something touched FINISH: ", body.name)
	if body is CharacterBody2D:
		print("Player detected! Loading win scene...")
		get_tree().change_scene_to_file("res://Game DONE/node_2d.tscn")
		"res://node_2d.tscn/your_scene_name.tscn"
