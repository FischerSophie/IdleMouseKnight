extends Node

"Object DUNGON = Dungon"
"CharacterBody2D Player = Chacter_Base" 
"List EQIPPMENt= EqimeTable"
" List WOunds = WoundTable"





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("DungonINGame")
	pass # Replace with function body.
	"LoadRandom Dungon"
	
"func_playerBesuchtDungon"
   "ersetze playersysmbol zu Dungonsymbol"
   "Vergeliche Dungon Werte mit Player werten"
   " Wenn Playerwert gößer als Dungonwert = sucsess"
   "Bei sucsess = random Equipment"
   " Call Function Attach Equipment to player"
   " bei Niederlage = schaden + Schadenseffect "
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
