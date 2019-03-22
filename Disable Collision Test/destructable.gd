extends KinematicBody2D


func _ready():
	add_to_group("takes_damage_from_player")


func _process(_delta):
	pass


func _on_hitbox_area_entered(area):
	print ("something is entering: ", area.name)
	if area.name == "attack_Area2D":
		print(self.name, " HIT")
		if self.is_in_group("takes_damage_from_player"):
			self.queue_free() 
