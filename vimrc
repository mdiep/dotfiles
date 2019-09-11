
set incsearch   " search as you type

set number " turn on line numbers

set autoindent
set expandtab       " insert spaces instead of tabs
set tabstop=4       " display tabs as 4 columns
set softtabstop=4   " insert 4 spaces when tab is pressed
set shiftwidth=4    " indent by 4 columns

set noswapfile      " don't use swapfiles

set signcolumn=yes  " always show the git gutter
set updatetime=100  " update after 100ms, not 4s

set wildmenu        " turn on the list of tab completion options
set wildmode=full   " tab complete to the first full match

" allow backspace to delete indentation and newlines and delete past
" where insert mode started.
set backspace=indent,eol,start

" configure the status line
set noshowmode   " don't show the normal mode indicator
set laststatus=2 " make room for lightline
let g:lightline = { 'colorscheme': 'wombat' }

augroup ColorOverrides
  autocmd!
  autocmd ColorScheme * highlight PreProc guifg=red guibg=grey15 ctermfg=red
                    \ | highlight Normal guifg=grey90
                    \ | highlight Comment guifg=grey50
                    \ | highlight DiffAdd guifg=#009900
                    \ | highlight DiffChange guifg=#bbbb00
                    \ | highlight DiffDelete guifg=#ff2222
augroup END
colo slate " Choose a color scheme
syntax on
hi illuminatedWord guibg=grey25 " Set the highlight color for vim-illuminate

set guifont=Operator\ Mono\ SSm:h11

" Keyboard shortcuts
" Fuzzy Finder
nnoremap <C-p> :<C-u>FZF<CR>

let mapleader = ","

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" Show errors from all checkers
let g:syntastic_aggregate_errors = 1
let g:syntastic_swift_checkers = ['swiftlint']

" Don't track history in ~/.vim/.netrwhist
let g:netrw_dirhistmax = 0

" Don't override the normal navigation commands
let g:wordmotion_prefix = '<Leader>'
