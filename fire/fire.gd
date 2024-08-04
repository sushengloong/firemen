extends Area2D

func _on_body_entered(body):
	print("fire body entered!")
	#queue_free()


func _on_area_entered(area):
	print("fire area entered!")
	queue_free()
