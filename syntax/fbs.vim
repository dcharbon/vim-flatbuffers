if exists("b:current_syntax")
  finish
endif

syn case match

syn keyword fbTodo contained TODO FIXME XXX
syn cluster fbCommentGrp contains=fbTodo

syn keyword fbSyntax include namespace attribute root_type
syn keyword fbTypeDef enum
syn keyword fbTypeDecl union struct table
syn keyword fbFieldType bool byte ubyte short ushort int uint float long ulong
syn keyword fbFieldType double string
syn keyword fbBool true false

syn region fbComment start="//" skip="\\$" end="$" keepend contains=@fbCommentGrp

syn match fbInt /-\?\<\d\+\>/
syn match fbInt /\<0[xX]\x+\>/
syn match fbFloat /\<-\?\d*\(\.\d*\)\?/

syn region fbString start=/"/ skip=/\\./ end=/"/

if version >= 508 || !exists("did_proto_syn_inits")
  if version < 508
    let did_proto_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink fbTodo Todo
  HiLink fbSyntax Include
  HiLink fbTypeDecl Structure
  HiLink fbFieldType Type
  HiLink fbTypeDef Typedef
  HiLink fbBool Boolean

  HiLink fbInt Number
  HiLink fbFloat Float
  HiLink fbComment Comment
  HiLink fbString String

  delcommand HiLink
endif

let b:current_syntax = "fbs"
