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

"source /usr/share/vim/vim72/plugin/mark.vim
"source /usr/share/vim/vim72/plugin/taglist.vim
"source /usr/share/vim/vim72/plugin/supertab.vim
"source /usr/share/vim/vim72/plugin/php-doc.vim

execute pathogen#infect()

highlight clear SpellBad

highlight SpellBad term=reverse cterm=underline

let g:DirDiffExcludes="CVS,*.class,*.exe,.*.swp,*.o,*.d,*.a,*.bb,*.bb,*.gcov"

map # :grep <cword> **/*.[ch]<Return><Return>:copen<Return>

map <F3> :TlistToggle <Return>
map <F4> :NERDTreeToggle<Return>
map <F5> <C-w>bj<Return>10<C-w>-


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


"set syntax as yang when opening *.yang files
au BufNewFile,BufRead *.yang setf yang


" Mappings for cscope
set cscopequickfix=s-,g-,c-,t-,e-,f-,i-,d-
noremap g<C-t> :!time cscope -R -b -q<CR>
"   's'   symbol: find all references to the token under cursor
"   'g'   global: find global definition(s) of the token under cursor
"   'c'   calls:  find all calls to the function name under cursor
"   't'   text:   find all instances of the text under cursor
"   'e'   egrep:  egrep search for the word under cursor
"   'f'   file:   open the filename under cursor
"   'i'   includes: find files that include the filename under cursor
"   'd'   called: find functions that function under cursor calls
nmap <Leader><Leader>s :cs find s <cword><CR>:cope<CR>
nmap <Leader><Leader>g :cs find g <cword><CR>:cope<CR>
nmap <Leader><Leader>c :cs find c <cword><CR>:cope<CR>
nmap <Leader><Leader>t :cs find t <cword><CR>:cope<CR>
nmap <Leader><Leader>e :cs find e <cword><CR>:cope<CR>
nmap <Leader><Leader>f :cs find f <cfile><CR>:cope<CR>
nmap <Leader><Leader>i :cs find i <cfile><CR>:cope<CR>
nmap <Leader><Leader>d :cs find d <cword><CR>:cope<CR>

nmap <Leader><Leader><Leader>s :cs find s
nmap <Leader><Leader><Leader>g :cs find g
nmap <Leader><Leader><Leader>c :cs find c
nmap <Leader><Leader><Leader>t :cs find t
nmap <Leader><Leader><Leader>e :cs find e
nmap <Leader><Leader><Leader>f :cs find f
nmap <Leader><Leader><Leader>i :cs find i
nmap <Leader><Leader><Leader>d :cs find d

nmap ] :cs find g  <cword><CR>
nmap [ <C-o>

function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction

" Automatically find and load Cscope databases
au BufEnter /* call LoadCscope()

" virtual tabstops using spaces
set shiftwidth=4
set softtabstop=4
set expandtab
" allow toggling between local and default mode
function TabToggle()
  if &expandtab
    set shiftwidth=4
    set softtabstop=0
    set noexpandtab
  else
    set shiftwidth=4
    set softtabstop=4
    set expandtab
  endif
endfunction
nmap <F2> mz:execute TabToggle()<CR>'z

let g:load_doxygen_syntax=1
au BufRead,BufNewFile *.dox setfiletype doxygen


function FormatClangStyle()
    %pyf /usr/share/vim/addons/syntax/clang-format-3.5.py
endfunction

map <C-k> :%py3f /usr/share/vim/addons/syntax/clang-format-4.0.py<CR>
imap <C-k> :%py3f /usr/share/vim/addons/syntax/clang-format-4.0.py<CR>

" Clear white spaces in file
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/


