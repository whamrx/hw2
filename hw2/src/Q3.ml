open NetKAT.Std
open Q1

let firewall : policy =
  	<:netkat<
		if (port = 1 && ethType = 0x0800 && ipProto = 0x06 && tcpDstPort = 22) then port := 2
		else $repeater
  	>>

let _ = run_static firewall
