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
alias lt="eza --icons --group-directories-first --tree --level=4 --git-ignore"
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
zoxide init fish | source

set -gx EDITOR /usr/bin/nvim
alias mpv="flatpak run io.mpv.Mpv"
alias claude='node -e "const f=require(\"os\").homedir()+\"/.claude.json\";try{const c=JSON.parse(require(\"fs\").readFileSync(f));if(c.oauthAccount?.accountUuid){delete c.oauthAccount.accountUuid;delete c.companion;require(\"fs\").writeFileSync(f,JSON.stringify(c,null,2));console.log(\"[buddy-fix] accountUuid removed\")}}catch{}" && command claude'

