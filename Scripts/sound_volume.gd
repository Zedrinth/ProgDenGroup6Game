extends HSlider


var sound_bus = AudioServer.get_bus_index("sound")


@warning_ignore("shadowed_variable_base_class")
func _on_sound_vol_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sound_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(sound_bus, true)
	else:
		AudioServer.set_bus_mute(sound_bus, false)
