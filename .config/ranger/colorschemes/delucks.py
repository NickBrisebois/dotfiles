# delucks' ranger theme

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class Default(ColorScheme):
	def use(self, context):
		fg, bg, attr = default_colors
		if context.border:
			attr = normal
			fg = black

		if context.reset:
			return default_colors

		elif context.in_browser:
			attr = normal
			fg = black
			if context.empty or context.error:
				fg = magenta
			if context.media:
				if context.image:
					fg = cyan
				else:
					fg = blue
			if context.container:
				attr |= bold
				fg = magenta
			if context.directory:
				attr |= normal
				fg = magenta
			elif context.executable and not \
					any((context.media, context.container,
						context.fifo, context.socket)):
				attr |= normal
				fg = red
			if context.socket:
				fg = red
			if context.fifo or context.device:
				fg = yellow
				if context.device:
					attr |= bold
			if context.link:
				fg = context.good and cyan or magenta
			if context.tag_marker and not context.selected:
				attr |= bold
				if fg in (red, magenta):
					fg = black
				else:
					fg = red
			if not context.selected and (context.cut or context.copied):
				fg = magenta
				attr |= bold
			if context.main_column:
				if context.selected:
					attr |= normal
				if context.marked:
					attr |= bold
					fg = yellow
			else:
				fg = black
			if context.badinfo:
				if attr & reverse:
					bg = magenta
				else:
					fg = green
			if context.selected:
				#attr = reverse
				fg = black
				bg = green

		elif context.in_titlebar:
			attr |= normal
			if context.hostname:
				attr |= bold
				fg = context.bad and red or black
			elif context.directory:
				fg = magenta
			elif context.tab:
				bg = black
				if context.good:
					fg = green
				else:
					fg = black
			elif context.link:
				fg = cyan
			else:
				fg = green

		elif context.in_statusbar:
			fg = black
			if context.permissions:
				if context.good:
					fg = black
				elif context.bad:
					fg = yellow
			if context.marked:
				attr |= bold | reverse
				fg = yellow
			if context.message:
				if context.bad:
					attr |= bold
					fg = red
			if (context.owner or context.group):
				fg = magenta

		elif context.in_taskview:
			if context.title:
				fg = blue
			if context.selected:
				attr |= reverse

		elif context.main_column:
			fg = black

		elif context.in_console:
			fg = black

		if context.text:
			if context.highlight:
				attr |= reverse

		return fg, bg, attr
