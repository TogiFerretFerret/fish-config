function listening
    # We use || echo "" to ensure the command doesn't fail entirely if the player is closed
    set -l info (playerctl metadata --format "{{ title }} - {{ artist }}" 2>/dev/null; or echo "Nothing Playing")
    
    echo "(status) Currently Listening To: $info" | kakasi -Ka -Ha -Ja -Ea -s | picord
end
