# set -g prefix C-bbind-key -n C-a send-prefix
unbind C-b
unbind C-a
unbind C-s
# set      -g prefix      ^S
set      -g prefix      C-s
# bind-key -n C-a send-prefix

# set      -g prefix2     ^A
# set      -g prefix2     F12
#             bind-key s  send-prefix
bind C-s send-prefix
# bind-key -n C-s send-prefix
# bind-key C-c  send-keys C-s c


## ########################################################################### #
bind-key -T prefix  t   clock-mode
# bind-key -T prefix  r  \
#   run-shell 'tmux setenv ZET_ses_mico "$(mrnd_ico)"' \; \
#   run-shell 'tmux source-file "${ZET_M_THEME}"'
##?!

bind-key -T prefix C-u set -g status off
# bind-key -T prefix C-u run-shell '_st=$(tmux show -gv status) ; _up="$(if [[ "$_st" == "off" ]]; then echo 'on'; else echo 'off'; fi)" ; tmux set -g status "$_up"'
# _up="$(if [[ "$(tmux show -gv status)" == "off" ]]; then echo 'on'; else echo 'off'; fi)" ; tmux set -g status "$_up"
 # ...
# _st=$(tmux show -gv status) ; _up="$(if [[ "$_st" == "off" ]]; then echo 'on'; else echo 'off'; fi)" ; tmux set -g status "$_up"
 # ...
# _st=$(tmux show -gv status) ; echo $_st ; echo '---------------'
# _up="$(if [[ "$_st" == "off" ]]; then echo 'on'; else echo 'off'; fi)"
# echo $_up ; echo '---------------'
# tmux set -g status "$_up"

# bind-key -T prefix C-f run-shell 'mtx -RF #{b:socket_path}'
# bind-key -T prefix C-b run-shell 'mtx -RB #{b:socket_path}'

#####

# bind -nr     C-M-R run-shell 'mtx -RR #{b:socket_path}' # \; send 'C-c'
# bind -nr     C-M-U run-shell 'mxcolr -u'  \; send 'C-c'
# bind -nr     C-M-O run-shell 'tmux set-option -w  @WIC "$(shuf -n 1 -e $(cat ~/mxx/mico/uni-mico))"'

# bind-key C-c send-keys C-s c
# bind-key z run-shell "tmux send-keys "C-s i" ; tmux display-message 'okkkr'"
# bind-key -n C-1 select-pane -t 1
# bind-key C-M-O  send-keys C-s c
# bind-key C    send-keys C-b C-b c

# bind-key C-M-U   send-keys C-M-I
# bind-key -n C-M-U send-prefix \; send-keys c

# bind -nr         C-M-I run-shell 'wic="$(shuf -n 1 -e $(cat ~/mxx/mico/uni-mico))"; \
# tmux set     @WIC "$wic"; \
# tmux set -w  @WIC "$wic"; \
# tmux set -gw @WIC "$wic"; \
# tmux set -g  @WIC "$wic"' \; display-message -d 500 "  set #{@WIC} from uni-mico."

# /home/meta/dev/meta/municode/dumps/uni-etc
bind -nr         C-M-I run-shell 'tmux set-option -w  @WIC "$(shuf -n 1 -e $(cat ~/dev/meta/municode/dumps/uni-etc))"'  \; display-message -d 500 "  set #{@WIC} from uni-etc. "

bind-key -T prefix C-i run-shell 'tmux set-option -w  @WIC "$(shuf -n 1 -e $(cat ~/dev/meta/municode/dumps/uni-etc))"'  \; display-message -d 500 "  set #{@WIC} from uni-etc. "
bind-key -T prefix   i run-shell 'tmux set-option -w  @WIC "$(shuf -n 1 -e $(cat ~/dev/meta/municode/dumps/uni-mico))"' \; display-message -d 500 "  set #{@WIC} from uni-mico."


bind -nr         C-M-R run-shell 'env -i mxcolr -r'  \; send 'C-c'
bind-key -T prefix   u run-shell 'env -i mxcolr -u'  \; send 'C-c'

bind-key -T prefix   R run-shell 'env -i mxcolr -s' \; display-message -d 500 "  snapshot saved."

# XXX
# bind-key -T prefix   I if-shell -b "(grep #{@WIC} ~/dev/meta/configs/scripts/municode/dumps/uni-mico)" {
#   display-message '#[bg=colour0,fg=colour1,fill=colour0,bold] #{@WIC} exists '
# } {
#   run-shell 'echo -n " #{@WIC}" >> ~/dev/meta/municode/dumps/uni-mico'
#   display-message -d 500 '  added #{@WIC} to uni-mico'
# }
# ############
# ### MENU ###

# bind-key -T prefix   C-r display-menu -T "#[align=centre]#{window_index}:#{window_name} #[fg=colour2]#{@WIC} " -x C -y P \
# "" \
# "-#[align=centre]#[nodim]╸mxc╺" "" "" \
# "#[fg=colour2,bg=colour0] ﳟ #[default] Demo     " "d" "send-keys 'env -i mxcolr -d' Enter" \
# "#[fg=colour4,bg=colour0]  #[default] List     " "l" "send-keys 'env -i mxcolr -l' Enter" \
# "#[fg=colour1,bg=colour0]  #[default] Upd-Full " "U" "run-shell 'env -i mxcolr -u full'" \
# "#[fg=colour3,bg=colour0] ﯓ #[default] Update   " "u" "run-shell 'env -i mxcolr -u'" \
# "#[fg=colour3,bg=colour0] ﰨ #[default] Generate " "r" "run-shell 'env -i mxcolr -r'" \
# "#[fg=colour2,bg=colour0] ﴖ #[default] Snap     " "S" "run-shell 'env -i mxcolr -s' \; display-message '  snapshot saved.'" \
# "" \
# "-#[align=centre]#[nodim]╸mic╺" "" "" \
# "#[fg=colour3,bg=colour0]  #[default] Rnd M.x"   "I" "run-shell 'tmux set-option -w  @WIC $(shuf -n 1 -e $(cat ~/mxx/mico/uni-mico))'\; display-message  ' set #{@WIC} from uni-mico.'" \
# "#[fg=colour3,bg=colour0]  #[default] Rnd ETC"   "i" "run-shell 'tmux set-option -w  @WIC $(shuf -n 1 -e $(cat ~/mxx/mico/uni-etc))'\;  display-message  ' set #{@WIC} from uni-etc. '" \
# "#[fg=colour2,bg=colour0]  #[default] Save mico" "s" "if-shell -b '(grep #{@WIC} ~/dev/meta/municode/dumps/uni-mico)' {
#   display-message '#[bg=colour0,fg=colour1,fill=colour0,bold]  exists : #{@WIC}'
# } {
#   run-shell 'echo -n \" #{@WIC}\" >> ~/dev/meta/municode/dumps/uni-mico'
#   display-message -d 500 '  added #{@WIC} to uni-mico'
# }" \
# "" \
# "#[fg=colour5,bg=colour0] ﰛ #[default] Source   " "e" "source-file $M_THEME"
# ############┗  ┗ ┛┏ ┓ ┫ ┣⎡⎤  ┊='·.╺ ━ ╸'
bind-key -T prefix   C-r display-menu -T "#[align=centre]#{window_index}:#{window_name} #[fg=#{@WBG}]#{@WIC} " -x C -y P \
"" \
"-#[align=centre]#[fg=#{@WBG},nodim,bold]╸mxc╺" "" "" \
"#[fg=colour2] ﳟ #[fg=#{@WBG}] Demo     " "d" "send-keys 'env -i mxcolr -d' Enter" \
"#[fg=colour4]  #[fg=#{@WBG}] List     " "l" "send-keys 'env -i mxcolr -l' Enter" \
"#[fg=colour1]  #[fg=#{@WBG}] eXP·v2   " "U" "run-shell 'env -i mxcolr -x2'" \
"#[fg=colour3] ﯓ #[fg=#{@WBG}] Update   " "u" "run-shell 'env -i mxcolr -u'" \
"#[fg=colour3] ﰨ #[fg=#{@WBG}] Generate " "g" "run-shell 'env -i mxcolr -g'" \
"#[fg=colour2] ﴖ #[fg=#{@WBG}] Snap     " "S" "run-shell 'env -i mxcolr -s' \; display-message '  snapshot saved.'" \
"" \
"-#[align=centre]#[fg=#{@EBG},nodim,bold]╸mico╺" "" "" \
"#[fg=colour2]  #[fg=#{@EBG}] Save mico" "s" "if-shell -b '(grep #{@WIC} ~/dev/meta/municode/dumps/uni-mico)' {
  display-message '#[bg=colour0,fg=colour1,fill=colour0,bold] #{@WIC} exists '
} {
  run-shell 'echo -n \" #{@WIC}\" >> ~/dev/meta/municode/dumps/uni-mico'
  display-message -d 500 '  added #{@WIC} to uni-mico'
}" \
"" \
"#[fg=colour5] ﰛ #[fg=#{@SBG}] Source   " "e" "source-file $M_THEME"
  # tmux -L $sock  run-shell 'mtxcolr -r' #\; source-file $M_THEME
# ###########            
# bind-key    -T prefix C-o display-menu -T "#[align=centre]#{window_index}:#{window_name} #[fg=colour2]#{@WIC} " -x C -y S \
# "itm1" I "run-shell 'tmux set-option -w  @WIC $(shuf -n 1 -e $(cat ~/mxx/mico/uni-mico))'\; display-message -d 1000 ' set #{@WIC} from uni-mico.'" \
# "itm2" i "run-shell 'tmux set-option -w  @WIC $(shuf -n 1 -e $(cat ~/mxx/mico/uni-etc))'\;  display-message -d 1000 ' set #{@WIC} from uni-etc. '"
###########
############
# bind-key    -T prefix C-o display-menu -T "#[align=centre]#{window_index}:#{window_name}" -x W -y W \
# " MICO " i "send-keys C-M-I" \
# " COLR " c "send-keys C-M-R" \
# "" \
# " MICO " I "send-prefix M-i" \
# " COLR " C "send-prefix M-o"\
############
# bind -n C-o command-prompt -kp key 'send prefix\; send-keys C-s %%%'
# bind -n C-o command-prompt -kp key 'send %%%'

# bind-key -n C-q send-prefix

############
# bind-key    -T prefix C-o display-menu -T "#[align=centre]#{window_index}:#{window_name}" -x W -y W \
# "#{?#{>:#{session_windows},1},,-}SXXX Left" l "swap-window -t:-1" \
# "#{?#{>:#{session_windows},1},,-}Swap Right" r "swap-window -t:+1" "\
# #{?pane_marked_set,,-}Swap Marked" s swap-window ''\
# KilO X kill-window \
# Respawn R "respawn-window -k" \
# "#{?pane_marked,Unmark,Mark}" m "select-pane -m" \
# ReZame n "command-prompt -I \"#W\" \"rename-window -- '%%'\"" '' \
# "New After" w "new-window -a" \
# "New At End" W new-window
############
# bind-key    -T prefix < display-menu -T "#[align=centre]#{window_index}:#{window_name}" -x W -y W "#{?#{>:#{session_windows},1},,-}Swap Left" l "swap-window -t:-1" "#{?#{>:#{session_windows},1},,-}Swap Right" r "swap-window -t:+1" "#{?pane_marked_set,,-}Swap Marked" s swap-window '' Kill X kill-window Respawn R "respawn-window -k" "#{?pane_marked,Unmark,Mark}" m "select-pane -m" Rename n "command-prompt -I \"#W\" \"rename-window -- '%%'\"" '' "New After" w "new-window -a" "New At End" W new-window
# bind-key    -T prefix > display-menu -T "#[align=centre]#{pane_index} (#{pane_id})" -x P -y P "#{?#{m/r:(copy|view)-mode,#{pane_mode}},Go To Top,}" < "send -X history-top" "#{?#{m/r:(copy|view)-mode,#{pane_mode}},Go To Bottom,}" > "send -X history-bottom" '' "#{?mouse_word,Search For #[underscore]#{=/9/...:mouse_word},}" C-r "if -F \"#{?#{m/r:(copy|view)-mode,#{pane_mode}},0,1}\" \"copy-mode -t=\" ; send -Xt= search-backward \"#{q:mouse_word}\"" "#{?mouse_word,Type #[underscore]#{=/9/...:mouse_word},}" C-y "copy-mode -q ; send-keys -l -- \"#{q:mouse_word}\"" "#{?mouse_word,Copy #[underscore]#{=/9/...:mouse_word},}" c "copy-mode -q ; set-buffer -- \"#{q:mouse_word}\"" "#{?mouse_line,Copy Line,}" l "copy-mode -q ; set-buffer -- \"#{q:mouse_line}\"" '' "Horizontal Split" h "split-window -h" "Vertical Split" v "split-window -v" '' "#{?#{>:#{window_panes},1},,-}Swap Up" u "swap-pane -U" "#{?#{>:#{window_panes},1},,-}Swap Down" d "swap-pane -D" "#{?pane_marked_set,,-}Swap Marked" s swap-pane '' Kill X kill-pane Respawn R "respawn-pane -k" "#{?pane_marked,Unmark,Mark}" m "select-pane -m" "#{?#{>:#{window_panes},1},,-}#{?window_zoomed_flag,Unzoom,Zoom}" z "resize-pane -Z"
############

 # (grep $(tmux display-message -p "#{@WIC}") ~/dev/meta/municode/dumps/uni-mico)
# bind -T prefix C-i run-shell 'tmux set-option -w  @WIC "$(shuf -n 1 -e $(cat ~/mxx/mico/uni-dump-format))"'

# bind-key -T prefix O run-shell 'echo -n " #{@WIC}" >> ~/dev/meta/municode/dumps/uni-mico' \; display-message "  added #{@WIC} " \;  send 'C-c'
  # bash -c 'shuf -n 1 -e $(cat ~/dev/meta/municode/dumps/uni-dump-format)'
# bind -nr     C-M-B run-shell 'mtx -RB #{b:socket_path}' # \; send 'C-c'
# bind -nr     C-M-I run-shell 'mtx -II #{b:socket_path}' # \; send 'C-c'
# bind -T prefix C-i run-shell 'mtx -ii #{b:socket_path}' # \; send 'C-c'
# bind -T prefix C-r run-shell 'mtx -rr #{b:socket_path}' # \; send 'C-c'
# bind -T prefix   R run-shell 'mtx -XR #{b:socket_path}' # \; send 'C-c'
# bind -T prefix   I run-shell 'mtx -XI #{b:socket_path}' # \; send 'C-c'

# bind -T prefix C-r send 'pastel paint red --on green "W  .. WINDOW"' \; send-keys 'Enter'
#####


# MTX_SNAPSHOT=~/.tmp/MTX_SNAPSHOT.tmux
 # ~/.tmp/mtx/snapshot.tmux
# " >> ~/.tmp/mtx/snapshot.tmux ; cp $M_XBASE/thm $M_XBASE/snapshots/$(date +%s)_thm -r' \; display-message "  snapshot saved. tail -f $M_SNAPSHOT_PATH" \;  send 'C-c'

# \; \
# \; run-shell 'tmux display-message -p "%s::%m.%d:%H.%M.%S --[[ SBG=#{@SBG}, SFG=#{@SFG}, WBG=#{@WBG}, WFG=#{@WFG}, WIC=#{@WIC} ]]--" >> $MTSNP' \; \  display-message "  snapshot saved. tail -f ${MTSNP}" \;  send 'C-c'
# %s::%m.%d:%H.
# WIC=#{@WIC} ]]--"' # >> ~/.tmp/MTX_SNAPSHOT.tmux' \; display-message "  snapshot saved. " #\; send 'C-c'
  # Zsc=#{ZET_ses_colr}\
  # SsF=#{@S-SCREEN_F}\
  # Zwc=#{ZET_win_colr}\
  # Zec=#{ZET_env_colr}\

  # run-shell 'dmp="$(cat /home/metaory/dev/meta/municode/dumps/uni-dump-format)"' \; \
# echo '### BOF ###' >> ~tmx/tmp/MTX_SNAPSHOT.tmux
#

# bind-key -T prefix   e run-shell 'mtx -e  #{b:socket_path}'
# bind-key -T prefix C-e run-shell 'mtx -E  #{b:socket_path}'
# bind-key -T prefix   r run-shell 'tmux setw @M_win_mico "$(mrnd_ico)"'

# bind-key -T prefix M-r setenv ZET_ses_mico "$(bash -c 'shuf -n 1 -e $(cat /home/metaory/dev/meta/municode/dumps/uni-dump-format)')"
# bash -c 'dmp="$(cat /home/metaory/dev/meta/municode/dumps/uni-dump-format)" ; declare -a arr=($dmp) ; echo "$(shuf -n 1 -e ${arr[@]})"'

# bind-key -T prefix  C-r run-shell 'mtx -r #{b:socket_path}'
## ########################################################################### #
# setenv ZET_ses_mico  "z" \; \
  # run-shell 'tmux setenv ZET_win_mico  "${MIOO:$(( RANDOM % ${#MIOO} )):1}"' \; \
## ########################################################################### #
## Navigations ##
# bind-key -n M-,         previous-window
# bind-key -n M-.         next-window

bind-key -n M-h         previous-window
bind-key -n M-l         next-window

# bind-key -T prefix u        set-option -g status off

bind-key -T prefix h         previous-window
bind-key -T prefix l         next-window
bind-key -T prefix k         switch-client   -p
bind-key -T prefix j         switch-client   -n

# bind-key -n C-K         switch-client   -p
# bind-key -n C-J         switch-client   -n

bind-key -n  C-M-H resize-pane     -L
bind-key -n  C-M-L resize-pane     -R
bind-key -n  C-M-K resize-pane     -U
bind-key -n  C-M-J resize-pane     -D

bind-key -T prefix M-1 select-layout even-horizontal \; resize-pane -x 120
bind-key -T prefix M-2 select-layout even-horizontal
bind-key -T prefix =   select-layout even-horizontal
bind-key -T prefix b   choose-buffer -Z

## ########################################################################### #
## Windows
bind-key -T prefix s split-window  -h -c "#{pane_current_path}"
bind-key -T prefix v split-window  -v -c "#{pane_current_path}"

# bind-key -T prefix s   split-window  -h -c "#{pane_current_path}";\ rename-window -t "#{window_id}" "#{window_panes}"
# bind-key -T prefix v   split-window  -v -c "#{pane_current_path}";\ command-prompt -I  "#W" "rename-window  -- '%%'"


## ########################################################################### #
## VI-Mode + Searches 

# unbind-key C-s
unbind-key -T prefix       /
bind-key   -T prefix       /   copy-mode
bind-key   -T prefix       C-_ command-prompt -p "?google:"           "run -b  'chromium  --new-window \"https://www.google.com/search?q=%%&btnl\"'"
# bind-key   -T prefix       C-_ command-prompt -p "?google:"           "run-shell -b  'chromium  --new-window \"https://www.google.com/search?q=%%&btnl\" > /dev/null'"
bind-key   -T copy-mode-vi y   send-keys      -X copy-pipe-and-cancel "xclip     -in -selection clipboard"
unbind-key -T copy-mode-vi [
bind-key   -T copy-mode-vi v   send-keys      -X begin-selection

############################################## >>>

## ########################################################################### #
## Killings

bind-key -T prefix d   confirm-before 'kill-session'
bind-key -T prefix C-d confirm-before 'detach-client'
bind-key -T prefix C-k confirm-before 'kill-server'

bind -n C-d  if-shell -b "[ $(tmux display-message -p \"#{T:pane_current_command}\" | grep zsh | wc -l) -eq 1 -a $(tmux list-windows | wc -l) -eq 1 -a $(tmux list-panes | wc -l) -eq 1 ]" {
  # display "A ? #{window_panes} #{session_windows} #{pane_current_command} -- #{T:pane_current_command}"
  # rename-session "AA #{pane_current_command} - #{T:pane_current_command}"
  confirm-before 'detach'
} {
  # display "B ? #{window_panes} #{session_windows} #{pane_current_command} -- #{T:pane_current_command}"
  # rename-session "BB #{pane_current_command} - #{T:pane_current_command}"
  send 'C-d'
}

## ########################################################################### #
## SESSIONS

  # run-shell 'dmp="$(cat /home/metaory/dev/meta/municode/dumps/uni-dump-format)"' \; \
  # run-shell 'dmp="declare -a arr=($dmp)' \; \
  # run-shell 'rnd_ico="$(shuf -n 1 -e ${arr[@]})"' \; \
  # run-shell 'tmux setenv ZET_win_mico  "$rnd_ico"' \; \

  # run-shell 'tmux setenv ZET_win_mico  "${MIOO:$(( RANDOM % ${#MIOO} )):1}"' \; \

# bind-key -T prefix c \
#   run-shell 'tmux setenv ZET_win_mico  "${MIOO:$(( RANDOM % ${#MIOO} )):1}"' \; \
#   new-window  -c "#{?#{pane_current_path},#{pane_current_path},~/void}" -n "${rnd_ico}" \; \
#   set -wF window-status-current-format "#{@L-WX}" \; \
#   set -wF window-status-current-style  "fg=#{@S-MAIN},bg=#{ZET_ses_colr}" \; \
#   source-file ~/.config/tmux/meta.min.tmuxtheme \; \
#   command-prompt -I  "#W" "rename-window  -- '%%'"
# tmux setenv ZET_ses_mico "$(bash -c 'shuf -n 1 -e $(cat /home/metaory/dev/meta/municode/dumps/uni-dump-format)')"
# run-shell 'tmux setenv ZET_win_mico  "${MIOO:$(( RANDOM % ${#MIOO} )):1}"' \; \

# run-shell "tmux setw @M_win_mico $(bash -c 'shuf -n 1 -e $(cat ~/dev/meta/municode/dumps/uni-dump-format)')" \; \
# new-window  -c "#{?#{pane_current_path},#{pane_current_path},~/void}" -n "#{@M_win_mico}" \; \

  # command-prompt -I  "#W" "rename-window  -- '%%'" \; \
  # set -wF window-status-current-format "#{@L-WX}" \; \
  # set -wF window-status-current-style  "fg=#{@S-MAIN},bg=#{@WBG}" \; \

# bind-key -T prefix c \
  # run-shell 'tmux setenv ZET_win_mico  "${MIOO:$(( RANDOM % ${#MIOO} )):1}"' \; \
  # new-window  -c "#{?#{pane_current_path},#{pane_current_path},~/void}" -n "#{ZET_win_mico}" \; \
  # set -wF window-status-current-format "#{@L-WX}" \; \
  # set -wF window-status-current-style  "fg=#{@S-MAIN},bg=#{ZET_win_colr}" \; \
  # command-prompt -I  "#W" "rename-window  -- '%%'" \; \
  # run-shell 'tmux source-file "${ZET_M_THEME}"'

  # set -wF window-status-current-format "#{@L-WX}" \; \
  # set -wF window-status-current-style  "bg=#{@WBG},fg=#{@WFG}" \; \
  # set -wF window-status-style  "bg=#{@OBG},fg=#{@OFG}" \; \
# bind C-l send-keys 'C-l'

bind C-c send-keys 'C-l'

bind-key -T prefix C run-shell 'mtx -n #{M_SOCK}'

bind-key -T prefix c \
  new-window  -c "#{?#{pane_current_path},#{pane_current_path},~/void}" -n "" \; \
  command-prompt -I  "#W" "rename-window  -- '%%'" \; \
  run-shell "tmux set -w @WIC $(bash -c 'shuf -n 1 -e $(cat ~/dev/meta/municode/dumps/uni-dump-format)')" \; \
  source-file ~/.config/tmux/meta.min.tmuxtheme
  # run-shell 'tmux source-file "${ZET_M_THEME}"'

# echo ${arr[$((( RANDOM % ${#arr[@]} ) + 0))]}
  # source-file "${ZET_M_THEME}"
  # run-shell 'tmux source-file "${ZET_M_THEME}"'
  # run-shell 'tmux source-file "${ZET_M_THEME}"'

  # run-shell "tmux rename-window $(bash -c 'arr=(A B C); echo ${arr[$((( RANDOM % ${#arr[@]} ) + 0))]})'" \; \


## ########################################################################### #
## Unbinds 
unbind-key -n F8
unbind-key -n F1
unbind-key -n F2
unbind-key -n F3
unbind-key -n F4
unbind-key -n F5
unbind-key -n F6
unbind-key -n F7
unbind-key -n F8
# ........................................................................... #
# ........................................................................... #
# bind-key -T prefix C-o run-shell 'tmux display-message -p "\
# XBG=\"###{=-6:@XBG}\" \
# XFG=\"###{=-6:@XFG}\" \
# WBG=\"###{=-6:@WBG}\" \
# WFG=\"###{=-6:@WFG}\" \
# EBG=\"###{=-6:@EBG}\" \
# EFG=\"###{=-6:@EFG}\" \
# SBG=\"###{=-6:@SBG}\" \
# SFG=\"###{=-6:@SFG}\" \
# OBG=\"###{=-6:@OBG}\" \
# OFG=\"###{=-6:@OFG}\" \
# DKB=\"###{=-6:@DKB}\" \
# DK0=\"###{=-6:@DK0}\" \
# DK1=\"###{=-6:@DK1}\" \
# DK2=\"###{=-6:@DK2}\" \
# DK3=\"###{=-6:@DK3}\" \
# DK4=\"###{=-6:@DK4}\" \
# DFG=\"###{=-6:@DFG}\" \
# WIC=\"###{@WIC}\" :: %s\
# " >> ~/.tmp/mtx/snapshot.tmux ; cp ~/dev/meta/configs/scripts/MXX/thm ~/dev/meta/configs/scripts/MXX/snapshots/$(date +%s)_thm -r' \; display-message "  snapshot saved. tail -f $M_SNAPSHOT_PATH" \;  send 'C-c'
# # " >> ~/.tmp/mtx/snapshot.tmux ; cp $M_XBASE/thm $M_XBASE/snapshots/$(date +%s)_thm -r' \; display-message "  snapshot saved. tail -f $M_SNAPSHOT_PATH" \;  send 'C-c'
#
# # \; \
