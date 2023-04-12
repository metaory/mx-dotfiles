local lain = require("lain")
local gears = require("gears")
local awful = require("awful")
local naughty = require("naughty")
local leader = require "awesome-leader"
local xresources = require("beautiful.xresources")
local xc = xresources.get_current_theme()
local with_wrapper = require('mlib/with_wrapper')
-- local mtheme = require('mtheme')
local thm = require("beautiful")

local ala_opt_center      = ' -o "initial_window_height" 30c" -o "initial_window_width 150c" '
local ala_opt_full_bottom = ' -o "initial_window_height" 20c" -o "initial_window_width 173c" '
local ala_opt_gap_bottom  = ' -o "initial_window_height" 15c" -o "initial_window_width 160c" '
local ala_opt_gap_corner  = ' -o "initial_window_height" 15c" -o "initial_window_width 80c"  '
local kit_opt_pad_small   = ' -o "window_padding_width 10" '
local kit_font_small      = ' -o "font_size 13.0" '

local ala_opt_pad_small   = ' --option "window.padding={x: 10, y: 10}" font.size=11.0 '

local exec_keys = leader.bind_actions({
    {"m", with_wrapper.shell("sudo mount /dev/sdc1 ~/mnt"), "Mount"},
    {"M", with_wrapper.shell("sudo umount /dev/sdc1"), "Unmount"},
    {"p", with_wrapper.shell("picom --experimental-backend & disown"), "Picom"},
    {"t", with_wrapper.term(kt_m_opt .. MX.kitty_opt_h.. MX.kitty_opt_c.."-T rtorrent rtorrent"), "rtorrent"},
    {"e", with_wrapper.term(kt_m_opt .. MX.kitty_opt_h.."-T ranger ranger"), "explore"},
    {"d" , with_wrapper.term(kt_m_opt .. " nvim -c 'VimwikiDiaryIndex'") ,"diary-index"},
    {"w" , with_wrapper.term(kt_m_opt .. " nvim -c 'VimwikiIndex'")      ,"wiki-index"},
    {"H" , with_wrapper.term(kt_m_opt .. "-T dhint  bat /home/meta/vimwiki/docs/cht-devhint.md"), "dev-hints"}   ,
    {"E", with_wrapper.term(kt_m_opt .. "-T nnn nnn"), "nxplore"},
})
 
-- ============================================================ --
local menu_keys = leader.bind_actions({
    {"m", function() 
        awful.menu.client_list({ theme = { width = 350 } })
    end, "menu"},
    desc = "menu_binds"
})
-- ============================================================ --
local web_keys = leader.bind_actions({
    {"i", with_wrapper.chromium(" --incognito"), "incognito"},
    {"I", with_wrapper.chromium(" --incognito https://hentaisun.com https://sukebei.nyaa.si/?f=0&c=1_1&q="), "echi"},

    {"W", with_wrapper.chromium(""), "empty"},
    {"w", with_wrapper.chromium_app("https://metaory.github.io?fg="..thm.fg_normal:sub(2)..'&bg='..thm.bg_normal:sub(2)), "home"},
    {"g", with_wrapper.chromium("https://github.com"), "github"},
    {"a", with_wrapper.chromium("https://nyaa.si/?f=0&c=1_2&q=720 https://nyaa.si/?f=0&c=1_2&q=erai+720 https://anilist.co/search/anime?year=2021&season=FALL"),"anilist"},
    {"n", with_wrapper.chromium_app("https://www.netflix.com"), 'Netflix'},
    {"y", with_wrapper.chromium_app("https://www.youtube.com"), "youtube"},
    desc = "web_binds"
})
-- .............................................................
-- TODO XXX
local iweb_keys = leader.bind_actions({
    {"m", function() 
        awful.menu.client_list({ theme = { width = 350 } })
    end, "iweb"},
    desc = "iweb_binds"
})
-- ############################################################### 
local term_keys =          leader.bind_actions({

      {"l"             , with_wrapper.shell(terminal..' less /tmp/mxsh.log')      , "MXSH_log"} ,
      {"t"             , with_wrapper.shell(terminal..' --name=MTX_MASTER mtx -n master')      , "start_master_mtx"} ,
      {"k" , with_wrapper.term       , "kitty"}    ,
      {"a" , with_wrapper.term(' --title ALACRITTY'                          , term_alacritty) , "start_term_alacritty"} ,
      {"u" , with_wrapper.term(terminal..' --name=MTX_UNO' ..term_mtx..'mtx -n')     , "start_uno"}            ,
      {"K", function()
            awful.spawn.with_shell(terminal .. " mtx -k master")
            awful.spawn.with_shell(terminal .. " mtx -k slave")
            awful.spawn.with_shell(terminal .. " mtx -k uno")
        end, "Kill all mtx"},
      {"1" , with_wrapper.mtx('master_tmux', 'toggle'),"toggle_master_tmx"},
      {"2" , with_wrapper.mtx('slave_tmux', 'toggle'), "toggle_slave_tmx"},
      desc      =          "tmux_binds"
})
local mlog = function (title, text) 
  if M_DEBUG then
    naughty.notify({ preset = naughty.config.presets.info, title = title .. ": ", text = tostring(text) })
  end
end
-- #############################################################################
-- ................................................
-- ################################################

Xleader = leader.leader(
  leader.wrap(
    leader.repeat_count,
    leader.bind({
        {"O", leader.action(function()
          awful.spawn.with_shell(terminal..' --title XSession --class M_SYS_LOG ' .. kit_opt_pad_small..' tail -f ~/.xsession-errors')
          awful.spawn.with_shell(terminal..' --title Journal  --class M_SYS_LOG ' .. kit_opt_pad_small..' journalctl -f')
        end), "OLogs"},
  }))
)
return Xleader

