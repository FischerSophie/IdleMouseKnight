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
		print("Player is dead!")
		
