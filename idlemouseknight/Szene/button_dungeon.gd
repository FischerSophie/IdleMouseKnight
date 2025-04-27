extends Button

func _on_pressed() -> void:
	
	var result = VisitCastle._playerBesuchtDungon()
	print(result)
	$"../Label_Events".append_text("The mouse enters ... and " + ("WINS!" if result[0] == 1 else "LOSES.") + "\n")
	$"../Label_Items".append_text(result[1] + "\n")
	
	if int(result[1]) != 0:
		$"../Label_Events".text = ("NO LOOT LEFT")
	else:
		match result[0]:
			0: player.wounds.append(LootManager.wound_table[result[1]])
			1: player.loot.append(LootManager.loot_table[result[1]])		
			
	var newstats = player.update_stats()
	$"../Label_Stats".text = ("Stats: \nStrength: " + str(player.strength) + "\nIntelligence: " + str(player.intelligence) + "\nSpeed:" + str(player.speed))
