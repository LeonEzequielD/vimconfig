filetype plugin indent on
syntax enable
source $VIMRUNTIME/mswin.vim
behave mswin
set ignorecase            " ignore case in search patterns
set wrap
set tabstop=4             " number of space <tab> counts for
set nocp
filetype plugin on 

colorscheme darkblue

source /usr/share/vim/vim72/plugin/mark.vim
source /usr/share/vim/vim72/plugin/taglist.vim
"source /usr/share/vim/vim72/plugin/supertab.vim
"source /usr/share/vim/vim72/plugin/php-doc.vim

highlight clear SpellBad
highlight SpellBad term=reverse cterm=underline

let g:DirDiffExcludes="CVS,*.class,*.exe,.*.swp,*.o,*.d,*.a,*.bb,*.bb,*.gcov"

map # :grep <cword> **/*.[ch]<Return><Return>:copen<Return>

map <F5> <C-w>bj<Return>10<C-w>-
map <F3> :TlistToggle <Return>

map <F4> :bd <Return>
imap <F4> <Esc> :bd <Return>

map <F12> /[^ =><!\&\|*/+-]=\\|=[^ =]\\|[^ -][><]\\| [><][^ =]\\|\(if(\)\\|\(while(\)\\|\(switch(\)\\|\(for(\)\\|\(do{\)\\|while.*(.*)\n[ \t]*{\\|switch.*(.*)\n[ \t]*{\\|if.*(.*)\n[ \t]*{\\|for.*(.*)\n[ \t]*{\\|else.*\n[ \t]*{\\|[,;][^ \t]\\|[ \t]\n<Esc><Return>:<Esc>
imap <F12> <Esc> /[^ =><!\&\|*/+-]=\\|=[^ =]\\|[^ -][><]\\| [><][^ =]\\|\(if(\)\\|\(while(\)\\|\(switch(\)\\|\(for(\)\\|\(do{\)\\|while.*(.*)\n[ \t]*{\\|switch.*(.*)\n[ \t]*{\\|if.*(.*)\n[ \t]*{\\|for.*(.*)\n[ \t]*{\\|else.*\n[ \t]*{\\|[,;][^ \t]\\|[ \t]\n<Esc><Return>:<Esc>

map <F11> :set wrap
imap <F11> <Esc> :set nowrap

map <F9> :Rgrep
imap <F9> <Esc>:Rgrep
			
"set nowrap
map <C-PageDown> :bnext <Return>
map <C-PageUp> :bprev <Return>

map <F8> :bd! <Return>

" Procura a palavra sob o cursor nos arquivos .c e .h no diretorio atual e todos os seus subdiretorios."
map <silent> <F7> :Rgrep -w <cword> *.c *.h *.cpp<CR><Return>
imap <F7>  <Esc><F7>

set hlsearch
set noexpandtab tabstop=4 shiftwidth=4
"set smarttab
set autoindent
filetype on
set showcmd
set wildignore=*.o,*.d
set wildmenu
set bs+=start
set bs+=indent
"so $VIMRUNTIME/ftplugin/man.vim
nnoremap K :Man <C-R><C-W><CR>
set gdefault
set spell
set spl=en
"set mousemodel=popup_setpos
set nu
"set tags+=.
set tags+=tags
"set tags+=/linuxppc/SELF/build/application/PD1200
"set tags+=/linuxppc/SELF/build/application/DMlib
"set tags+=../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
set shell=/bin/bash

au BufNewFile,BufRead *.t2t set ft=txt2tags
"au! BufNewFile,BufRead * let b:spell_language="brasileiro"

" marca tabulações e espaços
"set listchars=tab:>.,trail:.
"set list

"function MBTOn()
"   nnoremap <silent> <F8> :call MBTOff()<CR>
 "  let g:miniBufExplorerMoreThanOne=0
 "  TMiniBufExplorer
  " "norm
  " "nnoremap <buffer> <CR> :call LPenzMBESelectBuffer()<CR>:call MBTOff()<CR>:<BS>
"endfunction
"function MBTOff()
"   nnoremap <silent> <F8> :call MBTOn()<CR>
"   let g:miniBufExplorerMoreThanOne=99
"   TMiniBufExplorer
"endfunction 
"
"

aunmenu ToolBar.RunCtags
amenu ToolBar.RunCtags :!ctags -R --exclude="_built/common/include/boost/*" .<CR>

