# set-environment -g BYOBU_CONFIG_DIR $TMUX_CONFIG_DIR
set-environment -g TERM "tmux-256color"
# set-environment -g BYOBU_TERM "tmux-256color"
# set-environment -g BYOBU_BACKEND tmux
set-environment -g M_SNAPSHOT_PATH ~/.tmp/mtx/snapshot.tmux
set -s escape-time 0
setw -g xterm-keys on
set -g  mouse on
set -g  base-index 1
set -gw pane-base-index 1
set -g  display-panes-time 2000
set -g  display-time 3000

set -gw pane-border-status off
set -g  history-limit 10000
set -gw mode-keys vi
set -g  clock-mode-style 24
set -g set-titles on
set -g set-titles-string "#{pane_current_command} #{=-10:pane_current_path}|#{@WIC}"
set -g renumber-windows on
set -g automatic-rename on
set -g allow-rename on
set -g remain-on-exit off
set -g detach-on-destroy off

set -g focus-events on

set -g  default-command $SHELL
set -g  default-terminal "tmux-256color"
set -g  terminal-overrides 'xterm*:smcup@:rmcup@'
set -ga terminal-overrides ",xterm-*:Tc"
set -ga terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'
set -ga terminal-overrides ',*:Smol=\E[53m'

set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0

source-file $HOME/.config/tmux/meta.min.tmuxtheme

######
# source-file $XDG_CONFIG_HOME/mxc/mx-tmux
# source-file $XDG_CONFIG_HOME/byobu/meta.min.tmuxtheme
######
# new-session -d byobu-janitor

# mxColor=$(awk '{print $2}' <<< $(xrdb -query | grep color$((( RANDOM % 15 ) + 0))))
# set-environment -g M_BAT_CHARGING foobar


# set -s escape-time 300
# set-window-option -g xterm-keys on
##
# set -g default-command $SHELL
# set -g status-style bg=$BYOBU_DARK,fg=$BYOBU_LIGHT
# set -g status-interval 30
# set -w monitor-activity off
# set -g status-left-length 256
# set -g status-right-length 256
##
# set -g  history-limit 100000
# set -g  mode-keys vi

# set    default-terminal $TERM
# set -g default-terminal $TERM
# set -g default-terminal "xterm-256color"
# # FROM USR >
# set -ga terminal-overrides 'tmux*:smcup@:rmcup@'
# set -ga terminal-overrides ",tmux-*:Tc"
# <<
# set -g  terminal-overrides ",xterm-*:Tc"
#set -ga terminal-overrides ",xterm-termite:Tc"
#

# set-option -g pane-active-border-style bg=$BYOBU_HIGHLIGHT,fg=$BYOBU_HIGHLIGHT
# set-option -g pane-border-style fg=$BYOBU_ACCENT
# set-option -g history-limit 100000
# set-option -g display-panes-colour $BYOBU_ACCENT
# set-option -g display-panes-active-colour $BYOBU_HIGHLIGHT
# set-option -g clock-mode-colour $BYOBU_ACCENT
# set-option -g clock-mode-style 24
# set-option -g mode-keys vi
# set-option -g mode-style bg=$BYOBU_ACCENT,fg=$BYOBU_LIGHT

#set -g default-terminal "$BYOBU_TERM"


# { termite stable
# set -g  default-terminal "tmux-256color"
# set -g  terminal-overrides 'xterm*:smcup@:rmcup@'
# set -ga terminal-overrides ",xterm-*:Tc"
# }
# set -g  terminal-overrides 'xterm*:smcup@:rmcup@'
# set -g  default-terminal "alacritty-256color"
# set -g  terminal-overrides 'alacritty*:smcup@:rmcup@'
# set -ga terminal-overrides ",alacritty-*:Tc"

# set -s  terminal-overrides 'xterm*:smcup@:rmcup@'
# set -as terminal-overrides ",xterm-*:Tc"
# set -ga terminal-overrides ",*:Ss=\E[%p1%d q:Se=\E[2 q"
# set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'

# Must set default-command to $SHELL, in order to not source ~/.profile
# BUG: Should *not* hardcode /bin/bash here
# Use byobu-shell here, to show MOTD, but would do so with every new window and split
# set -g default-command 'exec byobu-shell'

#
# ############
# source $BYOBU_PREFIX/share/byobu/profiles/tmux
# setw -g mode-keys vi
# set-environment -g TERM "tmux-256color"
# ############
#
#
# # set -g default-terminal "$TERM"
# # set -g default-terminal "$TERM"
#
#
#
# # from usr share
#
# # set -g default-terminal "screen"
# #set -g default-terminal "$BYOBU_TERM"
#
# # set -g default-terminal "tmux-256color"
# # set -g default-terminal "tmux-256color"
# # set -g default-terminal "tmux"
#
# # The following helps with Shift-PageUp/Shift-PageDown
# #set -ga terminal-overrides ",xterm-termite:Tc"
# #
# # set -g terminal-overrides 'xterm*:smcup@:rmcup@'
# # set -ga terminal-overrides ",xterm-*:Tc"
#
# set -g status-style bg=$BYOBU_DARK,fg=$BYOBU_LIGHT
# set -g status-left-length 256
# set -g status-right-length 256
# set -g status-left '#(byobu-status tmux_left)'
# set -g status-right '#(byobu-status tmux_right)'$BYOBU_DATE$BYOBU_TIME
# set -g message-style bg=$BYOBU_ACCENT,fg=white
# setw -g window-status-style default
# setw -g window-status-style bg=$BYOBU_DARK,fg=$BYOBU_LIGHT
# setw -g window-status-current-style bg=$BYOBU_DARK,fg=$BYOBU_LIGHT,reverse
# setw -g window-status-activity-style bg=$BYOBU_DARK,fg=$BYOBU_LIGHT,bold
# setw -g automatic-rename on
# Change to Screen's ctrl-a escape sequence and use screen-like keys
# source $BYOBU_PREFIX/share/byobu/keybindings/tmux-screen-keys.conf
# Add ^A, F12 to the prefix list
# set -g prefix ^A
# Note, prefix2 only available in tmux 1.6+
# set -g prefix2 F12
# source $BYOBU_PREFIX/share/byobu/keybindings/f-keys.tmux
# set-option -g set-titles-string '⏽#S[#I.#P]#W'
# set-option -g set-titles-string '#S #W [#I.#P]'
# display-message -p "#{session_id}:#{window_index}:#{pane_index} %#{window_index}/#{session_windows} @#{pane_index}/#{window_panes}"
# set-option -g set-titles-string '[#S:#I:#P] □#S▴▵喝▲#W'▵ ⬡

# set -g set-titles-string "[ #S | #{ZET_S_IC} ] #{pane_current_command}"
# set -g set-titles-string "(#{ZET_ses_mico} - #S #W [#I.#P])"
# set -g set-titles-string "#{pane_current_command} #{b:pane_current_path}:#{ZET_ses_mico}"
# set -g set-titles-string "#{ZET_ses_mico}"

# set-hook -g pane-mode-changed[42] 'set -g status-left-style bg=red'
# set-option -g pane-mode-changed[42] 'set -g status-left-style bg=red'
# set-hook -g session-window-changed[44] 'setenv -g ZET_title_mico "#{ZET_win_mico}"'
  # set-hook -g session-window-changed[44] "run-shell 'tmux setenv ZET_win_mico  "#{ZET_win_mico}"'"
  # 

  # run-shell 'rnd_ico="$(shuf -n 1 -e ${arr[@]})"' \; \
# set -g set-titles-string "#{ZET_title_mico}"
# set -g set-titles-string '(#S #W [#I.#P])'
# set -g set-titles-string "#{@M_win_mico}"
# set -g   automatic-rename-format "#{b:pane_current_path}"

