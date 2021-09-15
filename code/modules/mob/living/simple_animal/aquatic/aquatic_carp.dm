/mob/living/simple_animal/hostile/retaliate/aquatic/carp
	name = "carp"
	desc = "A ferocious fish. May be too hardcore."
	icon = 'icons/mob/simple_animal/fish_carp.dmi'
	faction = "fishes"
	maxHealth = 20
	health = 20

	meat_type = /obj/item/chems/food/fish/carp
	meat_amount = 3
	bone_amount = 5
	skin_amount = 5
	bone_material = /decl/material/solid/bone/fish
	skin_material = /decl/material/solid/skin/fish

/mob/living/simple_animal/hostile/retaliate/aquatic/carp/Initialize()
	. = ..()
	default_pixel_x = rand(-8,8)
	default_pixel_y = rand(-8,8)
	reset_offsets(0)