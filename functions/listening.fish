function listening
	echo "(status) Currently Listening To: $(playerctl metadata title|kakasi -Ka -Ha -Ja -Ea -s) - $(playerctl metadata artist |kakasi -Ka -Ha -Ja -Ea -s)"|picord
end
