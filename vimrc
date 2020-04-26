
set incsearch   " search as you type
set ignorecase  " make search case-insensitive
set smartcase   " ...unless you use an uppercase character

set cursorline  " highlight the current line
set number      " turn on line numbers

set autoindent
set expandtab       " insert spaces instead of tabs
set tabstop=4       " display tabs as 4 columns
set softtabstop=4   " insert 4 spaces when tab is pressed
set shiftwidth=4    " indent by 4 columns

set foldmethod=syntax " base code folding on syntax highlighting
set foldlevelstart=99 " don't fold automatically

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

" configure :grep to use ag
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

filetype plugin on

colo mdiep " Choose a color scheme
syntax on
hi illuminatedWord guibg=grey25 " Set the highlight color for vim-illuminate

set guifont=Operator\ Mono\ SSm:h11

let mapleader = ","

" Keyboard shortcuts
nnoremap <Home> gg
nnoremap <End> G
" Cmd-[ to go back
nnoremap <D-[> <C-o>
" Cmd-] to go forward
nnoremap <D-]> <C-i>
" Fuzzy Finder
nnoremap <C-p> :<C-u>FZF<CR>
" Run!
nnoremap <leader>r :make<CR>

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
