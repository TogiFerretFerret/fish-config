function acord
	# basically display power manager stupid shit: listen for enter
	# and on enter execute `hyprctl dispatch dpms toggle` (kill on ctrl-c)
	# Interactive helper: press Enter to toggle DPMS; Ctrl-C to exit
	while true
		# prompt and wait for a line; read returns non-zero on Ctrl-C/EOF
		if not read line
			# interrupted (Ctrl-C) or EOF; exit loop
			echo
			break
		end
		# If input is empty (just Enter), toggle DPMS
		if test "$line" = "quit"
			echo "Quitting."
			break
		else if test "$line" = "exit"
			echo "Quitting."
			break
		else
			echo "$line"|picord
		end
	end
end

