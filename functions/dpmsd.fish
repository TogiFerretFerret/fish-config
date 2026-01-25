function dpmsd
	# basically display power manager stupid shit: listen for enter
	# and on enter execute `hyprctl dispatch dpms toggle` (kill on ctrl-c)
	# Interactive helper: press Enter to toggle DPMS; Ctrl-C to exit

	if not type -q hyprctl
		echo "dpmsd: hyprctl not found; please install hyprland or ensure hyprctl is in PATH"
		return 1
	end

	echo "dpmsd: Press Enter to toggle DPMS. Ctrl-C to exit. Type 'q' + Enter to quit."

	while true
		# prompt and wait for a line; read returns non-zero on Ctrl-C/EOF
		if not read line
			# interrupted (Ctrl-C) or EOF; exit loop
			echo
			break
		end

		# If input is empty (just Enter), toggle DPMS
		if test -z "$line"
			if hyprctl dispatch dpms toggle
				echo "DPMS toggled."
			else
				echo "Failed to toggle DPMS."
			end
		else if test "$line" = "q"
			echo "Quitting."
			break
		else
			echo "Press Enter to toggle DPMS, 'q' to quit, or Ctrl-C to exit."
		end
	end
end
