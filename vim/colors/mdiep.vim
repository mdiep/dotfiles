highlight clear 
if exists("syntax_on") 
  syntax reset 
endif

set background=dark
let g:colors_name="mdiep"

" Escape codes to enable italics in the terminal
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

highlight Normal guifg=grey90 ctermbg=234 guibg=#1e1e1e

highlight Error ctermbg=NONE guibg=NONE ctermfg=196 guifg=red
highlight! link ErrorMsg Error

highlight Comment ctermfg=172 guifg=#ee8e23

highlight Statement cterm=NONE gui=NONE ctermfg=69 guifg=#4b7ff1
highlight! link Structure Statement 
highlight! link Define Statement 

highlight LineNr guifg=#666666 ctermfg=242
highlight CursorLine cterm=NONE gui=none ctermbg=235 guibg=#262626 ctermfg=NONE guifg=NONE
highlight CursorLineNr cterm=NONE gui=NONE guifg=white ctermfg=246
highlight NonText guifg=#808080 ctermfg=244 cterm=NONE gui=NONE
highlight PreProc ctermfg=246 guifg=#949494

highlight Type cterm=italic gui=italic ctermfg=202 guifg=#f75d00
highlight Identifier cterm=NONE ctermfg=75 guifg=#5fafff
highlight String ctermfg=163 guifg=#d700af
highlight Constant ctermfg=135 guifg=#af5fff

highlight DiffAdd ctermbg=NONE guibg=NONE ctermfg=34 guifg=#00af00
highlight DiffChange ctermbg=NONE guibg=NONE ctermfg=220 guifg=#ffd700
highlight DiffDelete cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=196 guifg=#ff0000

highlight! link Question String
highlight! link Directory Type

highlight! link Title Type

highlight Underlined ctermfg=246 guifg=#949494

" Menus
highlight Pmenu ctermbg=236 guibg=#303030 ctermfg=white
highlight PmenuSel ctermbg=53 guibg=#5f005f ctermfg=white

" Markdown
highlight! link markdownListMarker PreProc
highlight! link markdownOrderedListMarker PreProc

" HTML
highlight htmlBold cterm=bold gui=bold
highlight htmlItalic cterm=italic gui=italic
