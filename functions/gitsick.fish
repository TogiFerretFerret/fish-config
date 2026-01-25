function gitsick
    # Capture the message into a variable first
    # 2>/dev/null hides the GTK warnings
    # Check the exit status of zenity
    # $status is 0 if you clicked OK, and 1 if you clicked Cancel/Esc
	git add .
	git commit -m "(acm-kakasi) Currently Listening To: $(playerctl metadata title|kakasi -Ka -Ha -Ja -Ea -s) - $(playerctl metadata artist |kakasi -Ka -Ha -Ja -Ea -s)"
	git push
end
