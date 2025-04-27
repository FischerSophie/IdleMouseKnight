extends Button

func _on_pressed() -> void:
	
	var result = VisitCastle._playerBesuchtDungon()
	print(result)
	$"../Label_Event".append_text("The mouse enters ... and " + ("WINS!" if result[0] == 1 else "LOSES.") + "\n")
	$"../Label_Items".append_text(result[1] + "\n")
