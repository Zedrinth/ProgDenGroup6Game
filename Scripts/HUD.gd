extends CanvasLayer


func _ready() -> void:
	$leaf.modulate = Color(1,1,1)
	$leaf2.modulate = Color(1,1,1)
	$leaf3.modulate = Color(1,1,1)
	var health = Global.current_health

func hita():
	if Global.current_health == 2:
		$leaf3.modulate = 200
	elif Global.current_health == 1:
		$leaf2.modulate = 200
	elif Global.current_health == 0:
		$leaf.modulate = 200
		
		
		

func _on_key_key_collected() -> void:
	$KeyHUD.modulate = Color(1,1,1)
		


func _on_key_2_key_collected() -> void:
	$KeyHUD2.modulate = Color(1,1,1)



func _on_key_3_key_collected() -> void:
	$KeyHUD3.modulate = Color(1,1,1)


func _on_level_1_tree_entered() -> void:
	print("entered scene 1")
	$KeyHUD.modulate = 200
	$KeyHUD2.visible = false
	$KeyHUD3.visible = false


func _on_level_2_tree_entered() -> void:
	$KeyHUD2.visible = true
	$KeyHUD3.visible = true
	$KeyHUD.modulate = 200
	$KeyHUD2.modulate = 200
	$KeyHUD3.modulate = 200
