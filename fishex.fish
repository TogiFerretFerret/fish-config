
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/river/miniforge3/bin/conda
	eval /home/river/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
	if test -f "/home/river/miniforge3/etc/fish/conf.d/conda.fish"
		. "/home/river/miniforge3/etc/fish/conf.d/conda.fish"
	else
		set -x PATH "/home/river/miniforge3/bin" $PATH
	end
end
# <<< conda initialize <<<
export TERMINFO="/usr/share/terminfo"


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
set -gx MAMBA_EXE "/home/river/miniforge3/bin/mamba"
set -gx MAMBA_ROOT_PREFIX "/home/river/.local/share/mamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<
