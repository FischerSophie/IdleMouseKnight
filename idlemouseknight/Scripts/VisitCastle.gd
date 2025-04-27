extends Node

"""Object DUNGON = Dungon
List_EQIPPMENT= EqimeTable"
List_Wounds = WoundTable"""

var Dungon = {
	"name": "GoblinCave",
	"strengt" : 3,
	"intelligent": 2,
	"speed" : 3
}
@onready var player = $player
	
func _ready() -> void:
	print("DungonINGame")
	_playerBesuchtDungon()



func _playerBesuchtDungon() -> void:
	if player.strengt >= Dungon.strengt:
		print("Player is alive!")
	else:
<<<<<<< HEAD
		print("Player is dead!")
		
=======
		return([0, attribute]) #Lose
	

func _playerBesuchtDungon():
	player.update_stats()
	var loot=""
	for encounter in range(3):
		var outcome = [0, "?"]
		#print(encounter)
		if encounter != 2:
			outcome = encounter()
			print("(FAVOURABLE) The mouse meets a ", outcome[1], " challenge ... and ", ("WINS!" if outcome[0] == 1 else "LOSES."))
			if !outcome[0]:  #If outcome is not 1 the Player lost an encounter
				loot = LootManager.get_loot("wound")
				#print(LootManager.get_loot("wound"))
				return([0, loot])
		else:
			outcome = encounter("unfavourable")
			print("(UNFAVOURABLE) The mouse meets a ", outcome[1], " challenge ... and ", ("WINS!" if outcome[0] == 1 else "LOSES."))			
			if !outcome[0]: #If outcome is not 1 the Player lost an encounter
				loot = LootManager.get_loot("wound")
				return([0, loot])
	
	#If it never retunred 0 its safe to assume all are won
	loot = LootManager.get_loot()
	return([1, loot]) 
>>>>>>> origin/main
