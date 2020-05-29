extends Sprite

export(NodePath) var nd_frmO
export(NodePath) var nd_frmD1
export(NodePath) var nd_frmD2
var arr_frm = []

var frmO
var frmD1
var frmD2

func _ready():
	var nd_arr_frm = [nd_frmO, nd_frmD1, nd_frmD2]
	var arr_frm = []
	
	for i in nd_arr_frm.size():
		var frm = get_node(nd_arr_frm[i])
		frm.connect("update_mult", self, "_on_updating_mult")
		arr_frm.append(frm)
		
	frmO = arr_frm[0]
	frmD1 = arr_frm[1]
	frmD2 = arr_frm[2]
	pass

func _on_updating_mult():
	var mult = 1
	#print(frmO.get_type())
	var tO = frmO.get_type()
	if tO != null:
		var tOk = tO.str_key
		var arr_tD = [frmD1.get_type(), frmD2.get_type()]
		for i in arr_tD.size():
			if arr_tD[i] != null:
				mult *= arr_tD[i].get_def_eff(tOk)
		
	set_scale(Vector2(mult, mult))
	pass
