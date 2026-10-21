" Vim syntax file
" Language: HTCondor submit description file

if exists("b:current_syntax")
  finish
endif

syntax case ignore

syntax keyword condorTodo TODO FIXME XXX NOTE contained
syntax match   condorComment /^\s*#.*$/ contains=condorTodo

" `name = value`: every command, then the common ones on top of it
syntax match condorCommand /^\s*\zs[A-Za-z_][A-Za-z0-9_.]*\ze\s*=/
syntax match condorCustomAttr /^\s*\zs+[A-Za-z_][A-Za-z0-9_.]*\ze\s*=/
syntax match condorKnownCommand /^\s*\zs\%(universe\|executable\|arguments\|environment\|getenv\|input\|output\|error\|log\|initialdir\|batch_name\|JobBatchName\|transfer_executable\|transfer_input_files\|transfer_output_files\|transfer_output_remaps\|should_transfer_files\|when_to_transfer_output\|request_cpus\|request_memory\|request_disk\|request_gpus\|requirements\|rank\|container_image\|docker_image\|max_retries\|max_materialize\|max_idle\|notification\|notify_user\|on_exit_hold\|on_exit_remove\|periodic_hold\|periodic_release\|periodic_remove\|priority\|accounting_group\|accounting_group_user\)\ze\s*=/

syntax match condorQueue /^\s*queue\>/

" macros: $(name), $(name:default), $$(attr), $ENV(VAR), $INT(x,%03d)
syntax match condorMacro /\$\$\=\w*([^)]*)/
syntax region condorString start=/"/ skip=/\\"/ end=/"/ oneline contains=condorMacro
syntax match condorNumber /\<\d\+\>/
syntax keyword condorBoolean true false

highlight default link condorTodo Todo
highlight default link condorComment Comment
highlight default link condorCommand Identifier
highlight default link condorCustomAttr PreProc
highlight default link condorKnownCommand Keyword
highlight default link condorQueue Statement
highlight default link condorMacro Special
highlight default link condorString String
highlight default link condorNumber Number
highlight default link condorBoolean Boolean

let b:current_syntax = "condor"
