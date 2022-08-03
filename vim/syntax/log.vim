" syntax highlighting for console logs

if exists('b:current_syntax')
  finish
endif

" 2020-05-12 08:43:30.588042-0700
syn match logTimestamp '^\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}:\d\{2}\(\.\d\{2,6}\)\?\([-+]\d\{4}\)\?'

syn match logPointer '0[xX]\x\+'


hi def link logPointer Statement
hi def link logTimestamp LineNr

let b:current_syntax = 'log'
