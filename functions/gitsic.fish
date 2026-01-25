function gitsic
    # Capture the message into a variable first
    # 2>/dev/null hides the GTK warnings
    # Check the exit status of zenity
    # $status is 0 if you clicked OK, and 1 if you clicked Cancel/Esc
	git add .
	git commit -m "(acm) Currently Listening To: $(playerctl metadata title) - $(playerctl metadata artist)"
	git push
end
