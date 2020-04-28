if exists('current_compiler')
	finish
endif
let current_compiler = "elm"

let s:save_cpo = &cpo
set cpo&vim

if exists(':CompilerSet') != 2
	command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=elm-test

" In theory, Elm's error messages could be recognized as multiline
" error messages. But in practice, it doesn't work well: you lose
" the line breaks and the structure needed to understand the error.
"
"CompilerSet errorformat+=
"        \%E--\ %[%^-]%#\ --%#\ %f,
"        \%-C%p^^%#,
"        \%-C%l\|%.%#,
"        \%-G(%.%#,
"        \%+C%.%#,
"        \%-G%.%#

let &efm = '-- %m --%# %f'

let &cpo = s:save_cpo
unlet s:save_cpo
