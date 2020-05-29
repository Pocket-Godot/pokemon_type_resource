extends Resource

export (String) var str_key
export (String) var name
export (Color) var color

export (Dictionary) var defensive_effectivenesses

func get_def_eff(key_type)->float:
	if defensive_effectivenesses.has(key_type):
		return defensive_effectivenesses[key_type]
	else:
		return 1.0
	pass
