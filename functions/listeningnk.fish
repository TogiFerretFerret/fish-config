function listeningnk
	echo "(status) Currently Listening To: $(playerctl metadata title) - $(playerctl metadata artist)"|picord
end
