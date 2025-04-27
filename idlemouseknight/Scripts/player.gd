extends CharacterBody2D

var base_strength = 25
var base_intelligence = 20
var base_speed = 20


var life = 100
var strength = base_strength
var intelligence = base_intelligence
var speed = base_speed

var loot = []
var wounds = []

func update_stats():
	#Set Basestats
	strength = base_strength
	intelligence = base_intelligence
	speed = base_speed
	
	#Add items to Basestats
	if loot.size() > 0:
		for item in loot:
			strength = strength + item["strength"]
			intelligence = intelligence + item["intelligence"]
			speed = speed + item["speed"]
			
	#Add wounds to Basestats
	if wounds.size() > 0:
		for item in wounds:
			strength = strength + item["strength"]
			intelligence = intelligence + item["intelligence"]
			speed = speed + item["speed"]
		
	#check if stat is negative and set to 0
	if strength < 0: strength = 0
	if intelligence < 0: intelligence = 0
	if speed < 0: speed = 0

	return([strength, intelligence, speed])

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
