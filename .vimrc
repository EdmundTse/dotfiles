set nocompatible
set backspace=indent,eol,start


set backup
set backupdir=~/tmp/vimbak
set backupcopy=yes
silent exec "!mkdir -p ~/tmp/vimbak"
silent exec "!find ~/tmp/vimbak -type f -mtime +3 -delete"


syntax on
filetype plugin indent on

" restore position when opening files
autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

" don't automatically continue comments on new lines
autocmd BufNewFile,BufRead * setlocal formatoptions-=r


" xterm mouse
set mouse=a

" xterm titles
set title
set t_ts=]0;
set t_fs=


" show useful things on the status line
set showmode
set showcmd
set ruler

" display as much as possible of the last line, instead of @
set display+=lastline

" matching brackets
set showmatch

" auto-complete should work like bash
set wildmode=longest,list

" show one extra line when scrolling
set scrolloff=1

" decent searching
set incsearch
set ignorecase
set smartcase
set hlsearch


" decent indentation
set autoindent
set copyindent
set shiftround

" spaces over tabs
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4

" single indent for line continuations
set cinoptions=+1s
set cinoptions=(1s
let g:pyindent_open_paren = &sw
let g:pyindent_continue = &sw
let g:vim_indent_cont = &sw

" don't allow syntax/sh.vim to change my iskeyword setting
let g:sh_noisk=1

" single space after full stop
set nojoinspaces

" disable octal
set nrformats-=octal


nmap <C-n> :next<CR>
nmap <C-p> :prev<CR>

nmap <C-l> :nohlsearch<CR>:redraw!<CR>

command SudoWrite call SudoWriteFunction()

map <F8> :call ToggleSpelling()<CR>
imap <F8> <C-o>:call ToggleSpelling()<CR>
map <F9> :call InvShow()<CR>
imap <F9> <C-o>:call InvShow()<CR>
map <F10> :call WrapToggle()<CR>
imap <F10> <C-o>:call WrapToggle()<CR>
map <F11> :call PasteToggle()<CR>
imap <F11> <C-o>:call PasteToggle()<CR>


function ToggleSpelling()
    if !exists("s:spell_check") || s:spell_check == 0
        echo  "Spell check on"
        let s:spell_check = 1
        setlocal spell spelllang=en_au
    else
        echo "Spell check off"
        let s:spell_check = 0
        setlocal spell spelllang=
    endif
endfunction

function WrapToggle()
    if &wrap
        set nowrap
        echo "Word wrap off"
    else
        set wrap
        echo "Word wrap on"
    endif
endfunction

function InvShow()
    if &list
        echo  "Invisible characters off"
        set nolist
    else
        echo "Invisible characters on"
        set listchars=tab:.\ ,trail:!
        set list
    endif
endfunction

function SudoWriteFunction()
    :w !sudo tee %
    :e!
endfunction

function PasteToggle()
    if &paste
        set nopaste
        echo "Paste mode disabled"
    else
        set paste
        echo "Paste mode enabled"
    endif
endfunction


" typos
command WQA :wqa
command WqA :wqa
command WQa :wqa
command Wqa :wqa
command WA :wa
command Wa :wa
command WQ :wq
command Wq :wq
command W :w
command Wn :wn
command WN :wn
command Wp :wp
command WP :wp
command QA :qa
command Qa :qa
command Q :q

