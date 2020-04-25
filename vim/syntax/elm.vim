" syntax highlighting for Elm (http://elm-lang.org/)

if exists('b:current_syntax')
  finish
endif

" Keywords
syn keyword elmConditional else if of then
syn keyword elmImport exposing as import module where skipwhite nextgroup=elmModuleName

" Comments
syn keyword elmTodo TODO FIXME XXX contained
syn match elmLineComment "--.*" contains=elmTodo,@spell
syn region elmComment matchgroup=elmComment start="{-|\=" end="-}" contains=elmComment,elmTodo,@spell fold

" Declarations
syn match elmTypeAlias "^type alias [A-Z][0-9A-Za-z_ ]* \s*=" contains=elmType,elmTypeAliasKeyword,elmTypeAliasParameter skipwhite skipnl nextgroup=elmType
syn keyword elmTypeAliasKeyword type alias contained
syn match elmTypeAnnotation "\<[a-z][0-9A-Za-z_]*\s*:" contains=elmOperator skipwhite skipnl nextgroup=elmType,elmTypeTuple
syn match elmTypeDeclaration "^type \%(alias\>\)\@!\%([A-Z][0-9A-Za-z_ ]*\)\=" contains=elmType skipwhite skipnl nextgroup=elmConstructorFirst
syn match elmConstructorFirst "=\_s*[A-Z(][0-9A-Za-z_ ()]*" contains=elmOperator,elmType,elmTypeTuple skipwhite skipnl nextgroup=elmConstructorRest
syn match elmConstructorRest "|\_s*[A-Z(][0-9A-Za-z_ ()]*" contains=elmOperator,elmType,elmTypeTuple skipwhite skipnl nextgroup=elmConstructorRest
syn match elmDefinition "\(\_^\s*\)\@<=\<[a-z][0-9A-Za-z_]*\>\(\(\s\+\<[a-z][0-9A-Za-z]*\>\)*\s*=\)\@="

" Delimiters
syn match elmDelimiter ","

" Literals
syn region elmLambda matchgroup=elmLambdaDelimiters start="(\\" end=")" contains=TOP fold
syn region elmList matchgroup=elmListDelimiters start="\[" end="\]" contains=TOP fold
syn region elmRecord matchgroup=elmRecordDelimiters start="{-\@!" end="-\@<!}" contains=TOP fold
syn region elmTuple matchgroup=elmTupleDelimiters start="(" end=")" contains=TOP fold

" Modules
syn match elmModule "\<[A-Z][0-9A-Za-z_]*\>\." contains=elmModuleSeparator
syn match elmModuleName "\<[A-Z][0-9A-Za-z_\.]*\>" contained
syn match elmModuleSeparator "\."

" Numbers
syn match elmInt "-\?\<\d\+\>\|0[xX][0-9a-fA-F]\+\>"
syn match elmFloat "\(\<\d\+\.\d\+\>\)"

" Operators
syn match elmOperator "\%(--\)\@![-!#$%`&\*\+./<=>\?@\\^|~:]"

" Strings
syn match elmStringEscape "\\u[0-9a-fA-F]\{4}" contained
syn match elmStringEscape "\\[nrfvbt\\\"]" contained
syn region elmString start="\"" skip="\\\"" end="\"" contains=elmStringEscape,@spell
syn region elmTripleString start="\"\"\"" skip="\\\"" end="\"\"\"" contains=elmStringEscape,@spell
syn match elmChar "'[^'\\]'\|'\\.'\|'\\u[0-9a-fA-F]\{4}'"

" Types
syn match elmType "\_s*\([=|]\s*\)\@<!\<[A-Z][0-9A-Za-z_]*\(\.[A-Z][0-9A-Za-z]*\)*" contained contains=elmModule,operator skipwhite skipnl nextgroup=@elmTypeContinue
syn cluster elmTypeContinue contains=elmType,elmTypeFunction,elmTypeParameter,elmTypeTupleParameter
syn match elmTypeImport "\<[A-Z][0-9A-Za-z_]*\%((\.\.)\)\@="
syn match elmTypeConstructor "\<[A-Z][0-9A-Za-z_]*\>\%(\.\|(\.\.)\)\@!"
syn match elmTypeFunction "->" contained skipwhite skipnl nextgroup=elmType,elmTypeParameter,elmTypeTuple
syn region elmTypeTuple start="(" end=")" contained contains=elmType,elmTypeParameter skipwhite skipnl nextgroup=elmTypeFunction
syn region elmTypeTupleParameter start="(" end=")" contained contains=elmType,elmTypeParameter skipwhite skipnl nextgroup=@elmTypeContinue
syn match elmTypeParameter "\<[a-z][a-z]*\>\([0-9A-Za-z_ ]*=\)\@!" contained skipwhite skipnl nextgroup=@elmTypeContinue
syn match elmTypeAliasParameter "\<[a-z][a-z]*\>" contained skipwhite skipnl nextgroup=@elmTypeContinue


" Blocks
syn region elmCaseBlock matchgroup=elmCaseBlockDefinition start="^\z\(\s\+\)\<case\>" end="^\z1\@!\W\@=" end="\(\n\n\z1\@!\)\@=" end="\n\z1\@!\(\n\n\)\@=" contains=TOP fold
syn region elmCaseItemBlock start="^\z\(\s\+\).\+->$" end="^\z1\@!\W\@=" end="\(\n\n\z1\@!\)\@=" end="\(\n\z1\S\)\@=" contains=TOP fold
syn region elmLetBlock matchgroup=elmLetBlockDefinition start="\<let\>" end="\<in\>" contains=TOP fold
syn region elmTopLevelDefinition start="\_^[a-z][0-9A-Za-z_]*\(\_s\+[a-z][0-9A-Za-z_]*\)*\_s*=" end="^\(\n\+\)\@=" contains=TOP fold
syn region elmLetDefinition start="\%(^\z\(\s\+\)\)\@<=[a-z][0-9A-Za-z_]*\(\_s\+[a-z][0-9A-Za-z_]*\)*\_s*=" end="^\z1\@!\(\s*\S\)\@=" end="\(\n\n\z1\@!\)\@=" end="\n\z1\@!\(\n\n\)\@=" contains=TOP fold


hi def link elmCaseBlockDefinition Conditional
hi def link elmCaseBlockItemDefinition Conditional
hi def link elmChar String
hi def link elmComment Comment
hi def link elmConditional Conditional
hi def link elmConstructorFirst Identifier
hi def link elmConstructorRest Identifier
hi def link elmDefinition Identifier
hi def link elmDelimiter Delimiter
hi def link elmFloat Float
hi def link elmImport Include
hi def link elmInt Number
hi def link elmLambdaDelimiters Delimiter
hi def link elmLetBlockDefinition Structure
hi def link elmLineComment Comment
hi def link elmListDelimiters Delimiter
hi def link elmModule Identifier
hi def link elmModuleName elmModule
hi def link elmOperator Operator
hi def link elmRecordDelimiters Delimiter
hi def link elmString String
hi def link elmStringEscape Special
hi def link elmTodo Todo
hi def link elmTripleString String
hi def link elmTupleDelimiters Delimiter
hi def link elmType Type
hi def link elmTypeAliasKeyword Keyword
hi def link elmTypeAliasParameter Identifier
hi def link elmTypeAnnotation Identifier
hi def link elmTypeConstructor Identifier
hi def link elmTypeDeclaration Keyword
hi def link elmTypeFunction Operator
hi def link elmTypeImport Type
hi def link elmTypeParameter Identifier


let b:current_syntax = 'elm'
