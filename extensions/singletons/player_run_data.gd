extends "res://singletons/player_run_data.gd"

static func init_effects()->Dictionary:
	if (not Utils == null) :
		var vanilla_effects = .init_effects()

		var new_effects: = {
			"use_physical_dice": 0,
		}

		new_effects.merge(vanilla_effects)

		return new_effects;
	else:
		return {}
