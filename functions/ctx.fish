function ctx
	argparse 'n/no-recurse' -- $argv
	or return

	set -l target_dir $argv[1]
	if test -z "$target_dir"
		set target_dir "."
	end

	# 1. Print the File Tree (Visual context for the AI)
	echo "--- REPOSITORY STRUCTURE ---"
	echo "curr dir:"
	pwd
	echo "eza tree:"
	eza --icons --group-directories-first --tree --level=100 --git-ignore $target_dir
	echo -e "\n--- FILE CONTENTS ---"

	# 2. Define the search command
	# We use 'fd' because it respects .gitignore by default and is faster than find.
	# If you don't have 'fd', you can use: find $target_dir -maxdepth $depth -not -path '*/.*'
		set -l fd_cmd fd --type f --hidden --exclude .git

		if set -q _flag_no_recurse
				set fd_cmd $fd_cmd --max-depth 1
		else
				set fd_cmd $fd_cmd --max-depth 100
		end

		# 3. Traverse and Print
		eval $fd_cmd $target_dir | while read -l file
				# Skip binary files to avoid dumping garbage into the terminal
				if is-binary $file
						continue
				end

				echo "================================================"
				echo "FILE: $file"
				echo "================================================"
				cat $file
				echo -e "\n"
		end
end

# Helper function to prevent dumping binaries (images, objects, etc.)
function is-binary
		# Check if the file contains a null byte in the first few bytes
		return (grep -qP '[^\x00-\x7f]' $argv[1])
end
