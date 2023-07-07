if status is-interactive
    # Set default editor to nvim
    set -gx EDITOR nvim

    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    alias gpaste='/google/src/head/depot/eng/tools/pastebin'


    # fish_vi_mode_prompt
    # Emulates vim's cursor shape behavior
    # Set the normal and visual mode cursors to a block
    set fish_cursor_default block
    # Set the insert mode cursor to a line
    set fish_cursor_insert line
    # Set the replace mode cursor to an underscore
    set fish_cursor_replace_one underscore
    # The following variable can be used to configure cursor shape in
    # visual mode, but due to fish_cursor_default, is redundant here
    set fish_cursor_visual block
end
