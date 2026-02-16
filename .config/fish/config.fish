if status is-interactive
    set -gx NVIM_APPNAME nvim_main/
    set -gx SUDO_EDITOR nvim

    # dotfiles alias
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

    # vi mode
    fish_vi_key_bindings

    # Starship custom prompt
    starship init fish | source

    # ------ Zoxide (better cd) -----
    command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source
    #
    # ------- Eza (Better ls) ------
    alias ls='eza --icons --group-directories-first --no-user --no-filesize -1'
    # alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

    # ------ FZF --------
    fzf --fish | source
    set -gx FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude node_modules --exclude .git"
    set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
    set -gx FZF_ALT_C_COMMAND "fd --type=d --hidden --strip-cwd-prefix --exclude node_modules --exclude .git"

    set -gx FZF_DEFAULT_OPTS "
        --style minimal
        --preview 'fzf-preview.sh {}'
        --preview-border=rounded
        --list-border=bottom
        --input-border=bottom
        --info=inline-right
        --color 'input-border:#cba6f7'
        --color bg+:#313244,bg:-1,spinner:#f5e0dc,hl:#f38ba8
        --color fg:#cdd6f4,header:#f38ba8,info:#f38ba8,pointer:#f5e0dc
        --color marker:#b4befe,fg+:#cdd6f4,prompt:#f38ba8,hl+:#f38ba8
        --color selected-bg:#45475a
        --color 'preview-border:#cba6f7'
        --color 'list-border:#cba6f7'
        --multi
    "

    function _fzf_compgen_path
        fd --hidden --exclude .git . $argv
    end

    function _fzf_compgen_dir
        fd --type=d --hidden --exclude .git . $argv
    end

    set -gx FZF_CTRL_T_OPTS "--preview 'bat -n --color=always --line-range :500 {}'"
    set -gx FZF_ALT_C_OPTS "--preview 'eza --tree --color=always {} | head -200'"

    bind \ez fzf-cd-widget
    bind -e \ec

    function _fzf_comprun
        set command $argv[1]
        set argv $argv[2..-1]

        switch $command
            case cd
                fzf --preview 'eza --tree --color=always {} | head -200' $argv
            case export unset
                fzf --preview "eval \'echo \$\'{}" $argv
            case ssh
                fzf --preview 'dig {}' $argv
            case '*'
                fzf --preview "bat -n --color=always --line-range :500 {}" $argv
        end
    end

    # ------- Bat (Better cat) ------
    export BAT_THEME="Catppuccin Mocha"

    # # Abbrs
    # abbr lg 'lazygit'
    # abbr gd 'git diff'
    # abbr ga 'git add .'
    # abbr gc 'git commit -am'
    # abbr gl 'git log'
    # abbr gs 'git status'
    # abbr gst 'git stash'
    # abbr gsp 'git stash pop'
    # abbr gp 'git push'
    # abbr gpl 'git pull'
    # abbr gsw 'git switch'
    # abbr gsm 'git switch main'
    # abbr gb 'git branch'
    # abbr gbd 'git branch -d'
    # abbr gco 'git checkout'
    # abbr gsh 'git show'
    #
    # abbr l 'ls'
    # abbr ll 'ls -l'
    # abbr la 'ls -a'
    # abbr lla 'ls -la'
    #
    # Custom colours
    cat ~/.local/state/caelestia/sequences.txt 2> /dev/null
    #
    # # For jumping between prompts in foot terminal
    # function mark_prompt_start --on-event fish_prompt
    #     echo -en "\e]133;A\e\\"
    # end
end

fish_add_path /home/joseph/.spicetify
