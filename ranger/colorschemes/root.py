# This file is part of ranger, the console file manager.
# License: GNU GPL version 3, see the file "AUTHORS" for details.

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class Default(ColorScheme):
    progress_bar_color = black

    def use(self, context):
        fg, bg, attr = default_colors

        fg = 35
        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            elif context.selected and (context.cut or context.copied):
                bg = black
                fg = yellow
            else:
                attr = normal
            if context.empty or context.error:
                fg =black
                bg = red
            if context.border:
                fg = default
            #if context.json:
                fg = 178
            #if context.code:
                fg = 41
            #if context.db:
                fg = 222
            if context.media:
                if context.image:
                    fg = 97
                elif context.audio:
                    fg = 39
                elif context.video:
                    fg = 114
                else:
                    fg = 39
            if context.container:
                fg = 125
            if context.directory:
                attr |= bold
                fg = 31
            elif context.executable and not \
                    any((context.media, context.container,
                        context.fifo, context.socket)):
                attr |= bold
                fg = 172
            if context.socket:
                fg = 197
                attr |= bold
            if context.fifo or context.device:
                fg = 197
                if context.device:
                    attr |= bold
            if context.link:
                fg = context.good and cyan or magenta
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (red, magenta):
                    fg = white
                else:
                    fg = red
            if context.selected and (context.cut or context.copied):
                fg = black
                bg = yellow
            if not context.selected and (context.cut or context.copied):
                bg = yellow
                fg = black
                attr |= bold
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked and not (context.cut or context.copied):
                    attr |= bold
                    fg = black
                    bg = green
                if context.marked and (context.cut or context.copied):
                    attr |= bold
                    fg = red
                    bg = green
            if context.badinfo:
                if attr & reverse:
                    bg = magenta
                else:
                    fg = magenta

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = context.bad and red or black
            elif context.directory:
                fg = 25
            elif context.tab:
                if context.good:
                    fg = green
                else:
                    fg = white
                    attr &= ~bold
            elif context.link:
                fg = cyan

        elif context.in_statusbar:
            fg = cyan
            if context.permissions:
                if context.good:
                    fg = green
                elif context.bad:
                    fg = magenta
            if context.marked:
                attr |= bold | reverse
                fg = yellow
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = red
            if context.loaded:
                bg = self.progress_bar_color
                fg = black
            if context.vcsinfo:
                fg = blue
                attr &= ~bold
            if context.vcscommit:
                fg = yellow
                attr &= ~bold


        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = blue

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color


        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = magenta
            elif context.vcschanged:
                fg = red
            elif context.vcsunknown:
                fg = red
            elif context.vcsstaged:
                fg = green
            elif context.vcssync:
                fg = green
            elif context.vcsignored:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync:
                fg = green
            elif context.vcsbehind:
                fg = red
            elif context.vcsahead:
                fg = blue
            elif context.vcsdiverged:
                fg = magenta
            elif context.vcsunknown:
                fg = red

        return fg, bg, attr
