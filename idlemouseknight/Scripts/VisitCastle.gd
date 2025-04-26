extends Node

"""Object DUNGON = Dungon
List_EQIPPMENT= EqimeTable"
List_Wounds = WoundTable"""

var Dungon = {
	"name": "GoblinCave",
	"strengt" : 0,
	"intelligent": 0,
	"speed" : 0
}
@onready var player = $player
	
func _ready() -> void:
	var wins = 0
	var loses = 0
	var WR = 0
	print("DungonINGame")
	for i in range(1): #WIE OFT SOLL PLAYER IN DEN DUNGEON GEHEN
		if _playerBesuchtDungon():
			wins = wins + 1
		else:
			loses = loses + 1
			
	WR = (float(wins) / (wins+loses))
	print("Wins: ", wins)
	print("Loses: ", loses)
	print("WR: ", WR)
		

func _playerBesuchtDungon():
	var challenge1 = randi_range(1,20) + randi_range(1,20)
	var challenge2 = randi_range(1,20) + randi_range(1,20)
	var challenge3 = randi_range(1,20) + randi_range(1,20)
	
	var max_value = max(player.strengt, player.intelligence, player.speed)
	var max_tied = []

	if player.strengt == max_value:
		max_tied.append("player.strengt")
	if player.intelligence == max_value:
		max_tied.append("player.intelligence")
	if player.speed == max_value:
		max_tied.append("player.speed")
		
	#print("Max value is", max_value)
	#print("Tied variables:", max_tied)
	
	var roll1 = max_value + randi_range(1,20)
	var roll2 = max_value + randi_range(1,20)
	var roll3 = "?"
	var unfavortype = "?"
	var favortype1 = "?"
	var favortype2 = "?"
	
	
	#ALS FUNKTION SCHREIBEN FÜR CLEANUP

	match randi_range(1,3):
		1:
			roll3 = player.strengt + randi_range(1,20)
			unfavortype = "Strengt"
		2:
			roll3 = player.intelligence + randi_range(1,20)
			unfavortype = "Intelligence"
		3:
			roll3 = player.speed + randi_range(1,20)
			unfavortype = "Speed"
		_:
			print("Not 1, 2, or 3")
			
			
	match max_tied[randi_range(0, (max_tied.size()-1))]:
		"player.strengt":
			favortype1 = "Strengt"
		"player.intelligence":
			favortype1 = "Intelligence"
		"player.speed":
			favortype1 = "Speed"
		_:
			print("Not 1, 2, or 3")
				
	match max_tied[randi_range(0, (max_tied.size()-1))]:
		"player.strengt":
			favortype2 = "Strengt"
		"player.intelligence":
			favortype2 = "Intelligence"
		"player.speed":
			favortype2 = "Speed"
		_:
			print("Not 1, 2, or 3")
					
	
	
	#FUNKTION DIE RANDOM ENCOUNTER BESCHREIBT FÜR ALLE TYPEN
	
	if roll1 >= challenge1:
		#print("Eine Herausforderung des Types: ", favortype1)
		if roll2 >= challenge2:
			#print("Eine Herausforderung des Types: ", favortype2)
			if roll3 >= challenge3:
				#print("Eine Herausforderung des Types: ", unfavortype)
				return(1)
			else:
				return(0)
		else:
			return(0)
	else:
		return(0)
		

	

	
