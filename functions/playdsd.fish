function playdsd
    ffprobe "$argv[1]"
    notify-send "Playing:" (echo $argv[1] | kakasi -Ka -Ha -Ja)
    pw-dsdplay -d "$argv[1]"
end
