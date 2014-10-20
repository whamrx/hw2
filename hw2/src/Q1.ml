open NetKAT.Std

(* a simple repeater *)
let all_ports : int32 list = [1l; 2l; 3l; 4l]

let flood (n : int32) : policy =
	List.fold_left
    	(fun pol m -> if n = m then pol else <:netkat<$pol + port := $m>>)
    	<:netkat<drop>> all_ports

let repeater : policy =
	List.fold_right
    	(fun m pol -> let p = flood m in <:netkat<if port = $m then $p else $pol>>)
    	all_ports <:netkat<drop>>

(* let _ = run_static repeater *)
