extends CanvasLayer



func _ready():
	$KeyHUD.modulate = 100
	$KeyHUD2.modulate = 100
	$KeyHUD3.modulate = 100

func _on_key_key_collected() -> void:
	$KeyHUD.modulate = Color(1,1,1)
		


func _on_key_2_key_collected() -> void:
	$KeyHUD2.modulate = Color(1,1,1)



func _on_key_3_key_collected() -> void:
	$KeyHUD3.modulate = Color(1,1,1)
