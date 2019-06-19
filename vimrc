" vim:set ts=2 sts=2 sw=2 expandtab:

"  remove all existing autocmds
autocmd!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Editting Configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=10000
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
" make searches case-sensitve only if they contain uppercase chars
set ignorecase smartcase
" highlight current line
set cursorline
set ruler
set cmdheight=1
set switchbuf=useopen
" always show tab bar at the top
set showtabline=2
set winwidth=79
set scrolloff=3
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insertmode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" enable highlighting for synax
syntax on
filetype plugin indent on
set wildmode=longest,list
set wildmenu
let mapleader=" "
:set timeout timeoutlen=1000 ttimeoutlen=100
set modeline
set modelines=3
set foldmethod=manual
set nofoldenable
set nojoinspaces
" if file is changed outside of vim reload without asking
set autoread
" apparently the old vim regex engine is more performant with ruby syntax
" highlihting
set re=1
" vertical diffs
set diffopt=vertical
set signcolumn=no
:set updatetime=1000
:set completeopt=menu,preview
" make it obvious where 80 chars is
set textwidth=80
set colorcolumn=+1
set number
set numberwidth=5

" load plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " clear autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " jump to last cusor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " for ruby, autoindent with two spaces, always expand tabs
  autocmd Filetype ruby,haml,eruby,yaml,html,sass,scss,cucumber set ai sw=2 sts=2 et
  
  autocmd! BufRead,BufNewFile *.sass setfiletype sass
  autocmd! BufRead,BufNewFile *.scss setfiletype scss

  " leave the return key alone when in commadn line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR() 

  " *.md is markdown
  autocmd! BufNewFile,BufRead *.md setlocal ft=

  " javascript
  autocmd! FileType javascript set sw=2 sts=2 expandtab autoindent smartindent nocindent
  
  " elm
  autocmd! FileType elm set sw=4 sts=4 expandtab autoindent smartindent nocindent

  " json
  autocmd! FileType json set sw=2 sts=2 expandtab


  " allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
hi StatusLine ctermbg=16 ctermfg=251
hi TabLine ctermbg=250 ctermfg=16
hi TabLineFill ctermbg=250 ctermfg=250

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>
" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" display extra whitespace
set listchars=tab:»\ ,nbsp:·,trail:·
" switch between the last two files
nnoremap <leader><leader> <c-^>
" FZF instead of ctrlp
" map <C-p> :FZF<CR>
