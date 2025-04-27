# LootManager.gd

extends Node

# Dictionary to store loot/wound and whether they've been "dropped" or not
var loot_table = {}
var wound_table = {}

# Called when the game starts, initializes the loot table
func _ready():
	#loottables from chatgpt
	loot_table = {		# Lootable items (magic items)
		"Sword of Flames": {"looted": false, "strength": 3, "intelligence": 0, "speed": 0},
		"Boots of Speed": {"looted": false, "strength": 0, "intelligence": 0, "speed": 3},
		"Wand of Magic": {"looted": false, "strength": 0, "intelligence": 2, "speed": 0},
		"Helmet of Wisdom": {"looted": false, "strength": 0, "intelligence": 3, "speed": -1},  # Slight nerf to speed
		"Shield of the Titan": {"looted": false, "strength": 2, "intelligence": 0, "speed": 0},
		"Bow of the Wind": {"looted": false, "strength": 1, "intelligence": 1, "speed": 1},
		"Arrow of Lightning": {"looted": false, "strength": 1, "intelligence": 1, "speed": 1},
		"Staff of Fire": {"looted": false, "strength": 0, "intelligence": 3, "speed": 0},
		"Ring of Invisibility": {"looted": false, "strength": 0, "intelligence": 1, "speed": 2},
		"Amulet of Protection": {"looted": false, "strength": 0, "intelligence": 1, "speed": 1},
		"Armor of Shadows": {"looted": false, "strength": 2, "intelligence": 0, "speed": 0},
		"Gloves of Strength": {"looted": false, "strength": 3, "intelligence": 0, "speed": -1},  # Nerf speed a bit
		"Dragon's Scale": {"looted": false, "strength": 2, "intelligence": 0, "speed": 1},
		"Golden Key": {"looted": false, "strength": 0, "intelligence": 0, "speed": 0},
		"Silver Coin": {"looted": false, "strength": 0, "intelligence": 0, "speed": 0},
		"Ruby of Power": {"looted": false, "strength": 2, "intelligence": 1, "speed": 0},
		"Sapphire of Agility": {"looted": false, "strength": 1, "intelligence": 0, "speed": 2},
		"Emerald of Wisdom": {"looted": false, "strength": 0, "intelligence": 3, "speed": 0},
		"Magic Scroll of Fireball": {"looted": false, "strength": 0, "intelligence": 3, "speed": 0},
		"Elixir of Wisdom": {"looted": false, "strength": 0, "intelligence": 3, "speed": 0},
		"Dragon Egg": {"looted": false, "strength": 1, "intelligence": 2, "speed": 0},
		"Crystal Sword": {"looted": false, "strength": 3, "intelligence": 0, "speed": 0},
		"Ancient Relic": {"looted": false, "strength": 1, "intelligence": 2, "speed": 0}
	}
	
	wound_table = { 	# Obtainable mystical wounds
		"Arm of the Cursed": {"looted": false, "strength": -2, "intelligence": 0, "speed": 0},
		"Eye of the Blind": {"looted": false, "strength": 0, "intelligence": -2, "speed": 0},
		"Leg of the Limp": {"looted": false, "strength": -1, "intelligence": 0, "speed": -2},
		"Head of Madness": {"looted": false, "strength": 0, "intelligence": -3, "speed": 0},
		"Chest of the Broken": {"looted": false, "strength": -1, "intelligence": 0, "speed": 0},
		"Hand of the Weak": {"looted": false, "strength": -1, "intelligence": 0, "speed": -1},
		"Foot of the Fallen": {"looted": false, "strength": -1, "intelligence": 0, "speed": -2},
		"Back of the Wounded": {"looted": false, "strength": -1, "intelligence": -1, "speed": 0},
		"Ribs of the Damned": {"looted": false, "strength": -2, "intelligence": 0, "speed": 0},
		"Neck of the Unstable": {"looted": false, "strength": 0, "intelligence": -2, "speed": -1},
		"Fingers of the Unlucky": {"looted": false, "strength": -1, "intelligence": 0, "speed": -1},
		"Toes of the Cold": {"looted": false, "strength": -1, "intelligence": -1, "speed": -1},
		"Jaw of the Mute": {"looted": false, "strength": 0, "intelligence": -1, "speed": 0},
		"Spine of the Fallen": {"looted": false, "strength": -3, "intelligence": 0, "speed": 0},
		"Heart of the Dying": {"looted": false, "strength": -2, "intelligence": 0, "speed": -1},
		"Lung of the Soulless": {"looted": false, "strength": -2, "intelligence": -1, "speed": 0},
		"Groin of the Shattered": {"looted": false, "strength": -2, "intelligence": 0, "speed": 0},
		"Shoulder of the Ailing": {"looted": false, "strength": -1, "intelligence": 0, "speed": -1},
		"Knee of the Crippled": {"looted": false, "strength": -2, "intelligence": 0, "speed": -2},
		"Elbow of the Hindered": {"looted": false, "strength": -1, "intelligence": 0, "speed": -1},
		"Wrist of the Broken": {"looted": false, "strength": -1, "intelligence": 0, "speed": -2},
		"Ankle of the Bound": {"looted": false, "strength": -1, "intelligence": 0, "speed": -3},
		"Scalp of the Lost": {"looted": false, "strength": 0, "intelligence": -2, "speed": -1},
		"Muscle of the Weakened": {"looted": false, "strength": -2, "intelligence": 0, "speed": 0},
		"Intestine of the Ripped": {"looted": false, "strength": -1, "intelligence": 0, "speed": -2},
		"Throat of the Silent": {"looted": false, "strength": -1, "intelligence": 0, "speed": -1},
		"Bicep of the Wounded": {"looted": false, "strength": -2, "intelligence": 0, "speed": 0},
		"Calf of the Hobbled": {"looted": false, "strength": -1, "intelligence": 0, "speed": -2},
		"Kidney of the Stricken": {"looted": false, "strength": -1, "intelligence": 0, "speed": -1},
		"Stomach of the Empty": {"looted": false, "strength": -1, "intelligence": -1, "speed": 0}
	}
	
func get_loot(type="item"):
	var available_loot = []
	var chosen = "??"

	match type:
		"item":
			for item in loot_table:
				if loot_table[item]: available_loot.append(item)
		"wound":
			for item in wound_table:
				if wound_table[item]: available_loot.append(item)

	
	if (available_loot.size() > 0):
		chosen = available_loot[randi_range(0 , (available_loot.size()-1))]
		loot_table[chosen] = false #dirty hack to set the item to false in both lists
		wound_table[chosen] = false
		return(chosen)
	else:
		return(0)	
