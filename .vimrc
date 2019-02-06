filetype plugin indent on
syntax enable

"Installing VBundle for plugion Mgt
set nocompatible              " be iMproved, required
filetype off                  " required


" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'Valloric/YouCompleteMe'

Plugin 'tpope/vim-fugitive'
Plugin 'shumphrey/fugitive-gitlab.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'inkarkat/vim-ingo-library'
Plugin 'inkarkat/vim-spellcheck'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()            " required
filetype plugin indent on    " required


"Adding microsoft buttons
source $VIMRUNTIME/mswin.vim
behave mswin

"ignore case sensitive in greps
set ignorecase

set nocp
filetype plugin on

colorscheme darkblue

execute pathogen#infect()

highlight clear SpellBad
highlight SpellBad term=reverse cterm=underline

let g:DirDiffExcludes="CVS,*.class,*.exe,.*.swp,*.o,*.d,*.a,*.bb,*.bb,*.gcov"

map <F3> :TlistToggle <Return>
map <F4> :NERDTreeToggle<Return>

"find possible wrong doings in C
map <F12> /[^ =><!\&\|*/+-]=\\|=[^ =]\\|[^ -][><]\\| [><][^ =]\\|\(if(\)\\|\(while(\)\\|\(switch(\)\\|\(for(\)\\|\(do{\)\\|while.*(.*)\n[ \t]*{\\|switch.*(.*)\n[ \t]*{\\|if.*(.*)\n[ \t]*{\\|for.*(.*)\n[ \t]*{\\|else.*\n[ \t]*{\\|[,;][^ \t]\\|[ \t]\n<Esc><Return>:<Esc>
imap <F12> <Esc> /[^ =><!\&\|*/+-]=\\|=[^ =]\\|[^ -][><]\\| [><][^ =]\\|\(if(\)\\|\(while(\)\\|\(switch(\)\\|\(for(\)\\|\(do{\)\\|while.*(.*)\n[ \t]*{\\|switch.*(.*)\n[ \t]*{\\|if.*(.*)\n[ \t]*{\\|for.*(.*)\n[ \t]*{\\|else.*\n[ \t]*{\\|[,;][^ \t]\\|[ \t]\n<Esc><Return>:<Esc>

"toggle between wrap and no wrap
function WrapToggle()
  if &wrap
    set nowrap
  else
    set wrap
  endif
endfunction
set wrap
nmap <F11> mz:execute WrapToggle() <CR>
imap <F11> <Esc> mz:execute WrapToggle() <CR>

"Ctrl + PageUp / PageDown changes pages
map <C-PageDown> :bnext <Return>
map <C-PageUp> :bprev <Return>

" Find words in all files in project
map <silent> <F7> :Rgrep -w <cword> *.c *.h *.cpp *.hpp<CR><Return>
imap <F7> <Esc>:Rgrep -w <cword> *.c *.h *.cpp *.hpp<CR><Return>


" Find words in all files in project
map <silent> <F5> :terminal<CR><Return>
imap <F5> <Esc>:terminal<CR><Return>

" # - Dumb grep on a word
map # :grep <cword> **/*.[ch]<Return><Return>:copen<Return>

set hlsearch
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
set shell=/bin/bash

aunmenu ToolBar.RunCtags
amenu ToolBar.RunCtags :!ctags -R --exclude="_built/common/include/boost/*" .<CR>

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


" Automatically find and load Cscope databases
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction

au BufEnter /* call LoadCscope()

"toggle between local and default mode
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
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
nmap <F2> mz:execute TabToggle()<CR>

"doxygen syntax
let g:load_doxygen_syntax=1
au BufRead,BufNewFile *.dox setfiletype doxygen

"yang syntax
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim

"txt2tags syntax
au BufNewFile,BufRead *.t2t set ft=txt2tags

" Clang format
map <C-k> :%pyf /usr/share/vim/addons/syntax/clang-format-4.0.py<CR>
imap <C-K> <c-o> :%pyf /usr/share/vim/addons/syntax/clang-format-4.0.py<CR>


"marks trailig spaces before enter
set listchars=tab:>.,trail:.
set list

" Clear white spaces in file
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

"NERDTree
let NERDTreeIgnore = ['\.sw[op]$']
let NERDTreeShowHidden=1

"Terminal
set splitbelow
hi Terminal ctermbg=black ctermfg=white guibg=black guifg=white
