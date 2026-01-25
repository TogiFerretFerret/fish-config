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
end
if status is-interactive
    # Commands to run in interactive sessions can go here
end



# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
zoxide init fish | source


