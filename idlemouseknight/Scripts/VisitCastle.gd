extends Node

"""Object DUNGON = Dungon
List_EQIPPMENT= EqimeTable"
List_Wounds = WoundTable"""

var Dungon = {
	"name": "GoblinCave",
	"strength" : 0,
	"intelligent": 0,
	"speed" : 0
}
@onready var player = $player
	
func _ready() -> void:
	
	var wins = 0
	var loses = 0
	var WR = 0 #Winrate
	
	print("DungonINGame")
	for i in range(1): #WIE OFT SOLL PLAYER IN DEN DUNGEON GEHEN
		if _playerBesuchtDungon(): #gibt bei erfolg 1 zurück und bei misserfolg 0
			wins = wins + 1
		else:
			loses = loses + 1
			
	WR = (float(wins) / (wins+loses))
	print("Wins: ", wins)
	print("Loses: ", loses)
	print("WR: ", WR)
		


func encounter(type="favourable"):
	var challenge = randi_range(1,20) + randi_range(1,20) #Challange Rating
	var roll = randi_range(1,20) #Player Roll to check against Challenge
	var attribute = "NULL" #Attribute to check against
	
	var max_value = max(player.strength, player.intelligence, player.speed) #Find max of all ATTERIBUTES
	var max_tied = [] #Stores all ATTRIBUTES that are max
	if player.strength == max_value:
		max_tied.append("player.strengt")
	if player.intelligence == max_value:
		max_tied.append("player.intelligence")
	if player.speed == max_value:
		max_tied.append("player.speed")
	
	
	match type: #Check what type of encounter and (usually) set an ATTRIBUTE to check against
		"favourable": #Take one of the best ATTRIBUTES
			match max_tied[randi_range(0, (max_tied.size()-1))]:
				"player.strengt":
					attribute = "strength"
				"player.intelligence":
					attribute = "intelligence"
				"player.speed":
					attribute = "speed"
				_:
					assert(false, "NO ATTRIBUTE FOUND IN FAVOURABLE ENCOUNTER")
		"unfavourable": #Take random ATTRIBUTE
			match randi_range(1,3):
				1:
					attribute = "strength"
				2:
					attribute = "intelligence"
				3:
					attribute = "speed"
				_:
					assert(false, "NO ATTRIBUTE FOUND IN UNFAVOURABLE ENCOUNTER")
		
	if ((roll+player.get(attribute)) > challenge): #Determines if player wins (tie loses)
		return([1, attribute]) #WIN
	else:
		return([0, attribute]) #Lose
	

func _playerBesuchtDungon():
	for encounter in range(3):
		var outcome = [0, "?"]
		#print(encounter)
		if encounter != 2:
			outcome = encounter()
			#print("(FAVOURABLE) The mouse meets a ", outcome[1], " challenge ... and ", ("WINS!" if outcome[0] == 1 else "LOSES."))
			if !outcome[0]: return(0) #If outcome is not 1 the Player lost an encounter
		else:
			outcome = encounter("unfavourable")
			#print("(UNFAVOURABLE) The mouse meets a ", outcome[1], " challenge ... and ", ("WINS!" if outcome[0] == 1 else "LOSES."))			
			if !outcome[0]: return(0) #If outcome is not 1 the Player lost an encounter
	return(1) #If it never retunred 0 its safe to assume all are won
