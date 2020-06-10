" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="filip"

hi Normal	guifg=White guibg=grey10
hi Cursor	guifg=black guibg=white


hi VertSplit	guibg=#FFFFFF guifg=grey50 gui=none
hi Folded	    guibg=grey50 guifg=white gui=bold
hi FoldColumn	guibg=grey30 guifg=tan

hi IncSearch	guifg=orange guibg=black
"hi LineNr
hi ModeMsg	guifg=goldenrod
hi MoreMsg	guifg=SeaGreen
hi NonText	guifg=LightBlue guibg=grey30
hi Question	guifg=springgreen
hi Search	guifg=black guibg=orange
hi SpecialKey	guifg=yellowgreen
hi Title	guifg=yellow
hi Visual	gui=none guifg=white guibg=#4466aa
"hi VisualNOS
hi WarningMsg	guifg=salmon

" syntax highlighting groups
hi Comment	    guifg=grey70    guibg=black    gui=italic
hi Constant	    guifg=white     guibg=black
hi PreProc	    guifg=skyblue   guibg=navy      gui=bold

hi Statement	guifg=white     guibg=#000055     gui=bold
hi Identifier	guifg=white     guibg=#004400     gui=bold,italic
hi Type		    guifg=white     guibg=#440000     gui=bold

hi Special	    guifg=yellow	gui=bold
hi Ignore	    guifg=grey40
hi Todo		    guifg=orangered guibg=khaki

