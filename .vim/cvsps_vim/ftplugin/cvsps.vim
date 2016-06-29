" Vim filetype plugin file
" Language:   cvsps
" Maintainer: Leandro Penz <lpenz@terra.com.br

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

fu! s:CvsPSDiff()
  let line = substitute(getline(line('.')), '^\s', '', '')
  let line = substitute(line, '\s$', '', '')
  let file = substitute(line, ':[0-9.]\+->[0-9.]\+', '', '')
  let line = substitute(line, '^[^:]\+:', '', '')
  let r1 = substitute(line, '->[0-9.]\+$', '', '')
  let r2 = substitute(line, '^[0-9.]\+->', '', '')

  exec ":split " . file
  resize +999
  exec ":CVSVimDiff ".r2." ".r1
endf

command! -nargs=0 CvsPSDiff :call s:CvsPSDiff()
nmap <buffer> <silent> <CR> :CvsPSDiff<CR>

