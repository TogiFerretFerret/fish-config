set -x NVM_DIR ~/.nvm
function mount_gdedit
	rclone mount gdedit: ~/mnt/gdrive --drive-root-folder-id 1Jv7Oct_EBdgdPE5cWwHiSgmSu7Mil1jU --vfs-cache-mode full --stats 1s -v
end
function mount_streaming
	rclone mount gdedit: ~/mnt/gdrive \
  --drive-root-folder-id 1Jv7Oct_EBdgdPE5cWwHiSgmSu7Mil1jU \
  --read-only \
  --vfs-cache-mode off \
  --buffer-size 256M
end
function mount_watching
	rclone mount gdedit: ~/mnt/gdrive \
  --drive-root-folder-id 1Jv7Oct_EBdgdPE5cWwHiSgmSu7Mil1jU \
  --vfs-cache-mode full \
  --read-only
end
function fish_greeting
	if status is-interactive
		echo "" && echo "";
		if test $COLUMNS -ge 159
			fastfetch --config ~/.config/fastfetch/wide.jsonc
		else
			fastfetch
		end
	end
end
if status is-interactive

end

function ls
    nu -c "ls $argv"
end

# The "Tree View" - See the hierarchy (Respects .gitignore!)
alias lt="eza --icons --group-directories-first --tree --level=2 --git-ignore"
alias yt-dlp='yt-dlp --extractor-args "youtube:player_client=default,-android_sdkless"'
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
zoxide init fish | source
set -gx EDITOR /usr/bin/nvim

