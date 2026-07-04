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
    if not pgrep -x gnome-keyring-d > /dev/null
        eval (gnome-keyring-daemon --start --components=secrets 2>/dev/null)
        set -gx GNOME_KEYRING_CONTROL $GNOME_KEYRING_CONTROL
    end
end

function ls
    set -l escaped_args (string escape -- $argv)
    nu -c "ls $escaped_args"
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



# Added by Antigravity CLI installer
set -gx PATH "/home/river/.local/bin" $PATH

fish_add_path -a "/home/river/.foundry/bin"

# terminal-wakatime setup
set -x PATH "$HOME/.wakatime" $PATH
function __terminal_wakatime_preexec --on-event fish_preexec
    set -g __TERMINAL_WAKATIME_COMMAND $argv[1]
    set -g __TERMINAL_WAKATIME_START_TIME (date +%s)
    set -g __TERMINAL_WAKATIME_PWD $PWD
end

function __terminal_wakatime_postexec --on-event fish_postexec
    if set -q __TERMINAL_WAKATIME_COMMAND
        set end_time (date +%s)
        set duration (math $end_time - $__TERMINAL_WAKATIME_START_TIME)
        set command "$__TERMINAL_WAKATIME_COMMAND"
        set pwd "$__TERMINAL_WAKATIME_PWD"

        # Clear variables immediately
        set -e __TERMINAL_WAKATIME_COMMAND
        set -e __TERMINAL_WAKATIME_START_TIME
        set -e __TERMINAL_WAKATIME_PWD

		fish -c '"/home/river/.wakatime/terminal-wakatime" track --command "$argv[1]" --duration "$argv[2]" --pwd "$argv[3]" >/dev/null 2>&1 &' -- "$command" "$duration" "$pwd"
    end
end
