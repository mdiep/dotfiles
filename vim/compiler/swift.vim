if exists('current_compiler')
	finish
endif
let current_compiler = "swift"

let s:save_cpo = &cpo
set cpo&vim

if exists(':CompilerSet') != 2
	command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=if\ $(cd\ %:p:h;\ swift\ package\ describe\ &>/dev/null);\ then\ swift\ build;\ else\ swift\ %;\ fi

CompilerSet errorformat+=
        \%f:%l:%c:\ %trror:\ %m,
        \%f:%l:%c:\ %tarning:\ %m,
        \%f:%l:\ %trror:\ %m,
        \%f:%l:\ %tarning:\ %m

let &cpo = s:save_cpo
unlet s:save_cpo
