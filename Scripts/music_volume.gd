extends HSlider

var music_bus = AudioServer.get_bus_index("music")

@warning_ignore("shadowed_variable_base_class")
func _on_music_vol_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(music_bus, true)
	else:
		AudioServer.set_bus_mute(music_bus, false)
