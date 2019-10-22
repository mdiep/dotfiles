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

highlight Comment ctermfg=172 guifg=#ee8e23

highlight Statement cterm=NONE gui=NONE ctermfg=69 guifg=#4b7ff1
highlight! link Structure Statement 
highlight! link Define Statement 

highlight LineNr guifg=#666666 ctermfg=242
highlight PreProc ctermfg=246 guifg=#949494

highlight Type cterm=italic gui=italic ctermfg=202 guifg=#f75d00
highlight Identifier cterm=NONE ctermfg=75 guifg=#5fafff
highlight String ctermfg=160 guifg=#d70000
highlight Constant ctermfg=135 guifg=#af5fff

highlight DiffAdd ctermfg=28 guifg=#008700
highlight DiffChange ctermfg=226 guifg=#ffff00
highlight DiffDelete ctermfg=196 guifg=#ff0000
