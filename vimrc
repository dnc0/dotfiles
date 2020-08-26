set number
set tabstop=4
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent 
syntax on
set noet
set ci
set pi
set sts=0
set sw=4
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
set laststatus=2
set statusline=
set statusline+=%{StatuslineGit()}
set statusline+=\ %f
set statusline+=\%=
set statusline+=\ %y
set statusline+=\ %l:%c
