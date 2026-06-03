function _tide_seg_str -a label bg fg
    if test -z "$bg"; set bg 444444; end
    if test -z "$fg"; set fg FFFFFF; end
    set -l br (math "0x"(string sub -s 1 -l 2 $bg))
    set -l bg2 (math "0x"(string sub -s 3 -l 2 $bg))
    set -l bb (math "0x"(string sub -s 5 -l 2 $bg))
    set -l fr (math "0x"(string sub -s 1 -l 2 $fg))
    set -l fg2 (math "0x"(string sub -s 3 -l 2 $fg))
    set -l fb (math "0x"(string sub -s 5 -l 2 $fg))
    printf "\e[48;2;%d;%d;%dm\e[38;2;%d;%d;%dm %s \e[0m" $br $bg2 $bb $fr $fg2 $fb $label
end

function tide-preview-line
    set -l cols (math $COLUMNS 2>/dev/null; or echo 220)

    set -l left_segs \
        "󰣇 arch:tide_os_bg_color:tide_os_color" \
        "~/idktheflag/Website:tide_pwd_bg_color:tide_pwd_color_anchors" \
        " main:tide_git_bg_color:tide_git_color_branch"

    set -l right_segs \
        "42ms:tide_cmd_duration_bg_color:tide_cmd_duration_color" \
        "node:tide_node_bg_color:tide_node_color" \
        "py:tide_python_bg_color:tide_python_color" \
        "rs:tide_rustc_bg_color:tide_rustc_color" \
        "go:tide_go_bg_color:tide_go_color" \
        "java:tide_java_bg_color:tide_java_color" \
        "php:tide_php_bg_color:tide_php_color" \
        "ruby:tide_ruby_bg_color:tide_ruby_color" \
        "bun:tide_bun_bg_color:tide_bun_color" \
        "elixir:tide_elixir_bg_color:tide_elixir_color" \
        "zig:tide_zig_bg_color:tide_zig_color" \
        "crystal:tide_crystal_bg_color:tide_crystal_color" \
        "nix:tide_nix_shell_bg_color:tide_nix_shell_color" \
        "12:34:tide_time_bg_color:tide_time_color"

    set -l left_out ""
    set -l left_len 0
    for seg in $left_segs
        set -l parts (string split : $seg)
        set -l label $parts[1]
        set -l bg $$parts[2]
        set -l fg $$parts[3]
        set left_out $left_out(_tide_seg_str $label $bg $fg)
        set left_len (math $left_len + (string length -- " $label "))
    end

    set -l right_out ""
    set -l right_len 0
    for seg in $right_segs
        set -l parts (string split : $seg)
        set -l label $parts[1]
        set -l bg $$parts[2]
        set -l fg $$parts[3]
        set right_out $right_out(_tide_seg_str $label $bg $fg)
        set right_len (math $right_len + (string length -- " $label "))
    end

    set -l gap (math $cols - $left_len - $right_len)
    if test $gap -lt 1; set gap 1; end

    printf "%s%s%s\n" $left_out (string repeat -n $gap " ") $right_out
    printf "\e[38;2;139;233;253m╰─❯\e[0m \n"
end

function tide-preview
    set -l items \
        "os:tide_os_bg_color:tide_os_color" \
        "pwd:tide_pwd_bg_color:tide_pwd_color_anchors" \
        "git:tide_git_bg_color:tide_git_color_branch" \
        "time:tide_time_bg_color:tide_time_color" \
        "status:tide_status_bg_color:tide_status_color" \
        "cmd_duration:tide_cmd_duration_bg_color:tide_cmd_duration_color" \
        "jobs:tide_jobs_bg_color:tide_jobs_color" \
        "node:tide_node_bg_color:tide_node_color" \
        "python:tide_python_bg_color:tide_python_color" \
        "rustc:tide_rustc_bg_color:tide_rustc_color" \
        "go:tide_go_bg_color:tide_go_color" \
        "java:tide_java_bg_color:tide_java_color" \
        "php:tide_php_bg_color:tide_php_color" \
        "ruby:tide_ruby_bg_color:tide_ruby_color" \
        "bun:tide_bun_bg_color:tide_bun_color" \
        "elixir:tide_elixir_bg_color:tide_elixir_color" \
        "zig:tide_zig_bg_color:tide_zig_color" \
        "crystal:tide_crystal_bg_color:tide_crystal_color" \
        "nix_shell:tide_nix_shell_bg_color:tide_nix_shell_color"

    for item in $items
        set -l parts (string split : $item)
        set -l label $parts[1]
        set -l bg $$parts[2]
        set -l fg $$parts[3]
        if test -z "$bg"; set bg 444444; end
        if test -z "$fg"; set fg FFFFFF; end
        printf "%s  #%s on #%s\n" (_tide_seg_str $label $bg $fg) $fg $bg
    end
end
