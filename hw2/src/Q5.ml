open NetKAT.Std

(* a simple repeater *)
let routing : policy =
  <:netkat<
	if switch = 2 || switch = 3 then
    		if port = 1 then port := 2 + port := 3
    		else if port = 2 then port := 1 + port := 3
    		else if port = 3 then port := 1 + port := 2
    		else drop
	else if switch = 1 then
		if port = 1 then port := 2
		else if port = 2 then port := 1
		else drop
	else drop
  >>

let _ = run_static routing
