"set autoindent
"set tabstop=4

"set hlsearch

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>

"au BufNewFile,BufRead .bash_aliases call SetFileTypeSH("bash")

"filetype plugin indent on
"syntax on





"The following three lines map Ctrl+s to save in vi.  You can comment 
""these out, it has nothing to do with syntax highlighting or colors.

" optional lines to turn on pressing F2 to toggle paste mode
noremap <F2> :set invpaste paste?<CR>i
set pastetoggle=<F2>


:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
:imap <c-s> <Esc><c-s>

syntax on
"set background=dark
" set hlsearch
"set nu
" set smartindent  "smartindent doesn't take care of python hashtag comments
" correctly, use cindent:    
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
"set cursorline
"au BufNewFile,BufRead .bash_aliases call SetFileTypeSH("bash")
filetype on
filetype plugin indent on

colorscheme srcery

"au BufReadPost,BufNewFile .bash_aliases* call SetFileTypeSH("bash")
au BufReadPost,BufNewFile *.twig colorscheme koehler 
au BufReadPost,BufNewFile *.css colorscheme slate
au BufReadPost,BufNewFile *.js colorscheme srcery 
au BufReadPost,BufNewFile *.sh colorscheme srcery
au BufReadPost,BufNewFile *.py colorscheme srcery
"au BufReadPost,BufNewFile *.py colorscheme molokaiyo
au BufReadPost,BufNewFile *.html colorscheme srcery
au BufReadPost,BufNewFile *.java colorscheme monokai
au BufReadPost,BufNewFile *.pl colorscheme desert
" au BufReadPost,BufNewFile *.php colorscheme monokai

"fixes the highlighting issue with the srcery colorscheme
au BufReadPost,BufNewFile *.js hi Search cterm=NONE ctermfg=blue ctermbg=white
au BufReadPost,BufNewFile *.py hi Search cterm=NONE ctermfg=grey ctermbg=blue
au BufReadPost,BufNewFile *.sh hi Search cterm=NONE ctermfg=grey ctermbg=blue
au BufReadPost,BufNewFile *.html hi Search cterm=NONE ctermfg=grey ctermbg=blue

" Default line highlighting for unknown filetypes
"hi String ctermfg=140
hi CursorLine ctermbg=17
"au BufReadPost,BufNewFile *.sh hi CursorLine ctermfg=255
"au BufReadPost,BufNewFile *.bash_profile hi CursorLine ctermfg=255
hi CursorLine guibg=#D3D3D3 cterm=none
"
"What follows are optional things, I like them
"
" "au BufNewFile,BufRead *.py 
" "        \ set tabstop=4 
" "        \ set shiftwidth=4     "aand fedora doesn't like this parameter,
" remove this line.
" "        \ set textwidth=79 
" "        \ set expandtab 
" "        \ set autoindent 
" "        \ set fileformat=unix
"
" " Commenting blocks of code.
" " This specifies the comment character when specifying block comments.
" "autocmd FileType c,cpp,java,scala let b:comment_leader = '//'
" "autocmd FileType sh,ruby,python   let b:comment_leader = '#'
" "autocmd FileType conf,fstab       let b:comment_leader = '#'
" "autocmd FileType tex              let b:comment_leader = '%'
" "autocmd FileType mail             let b:comment_leader = '>'
" "autocmd FileType vim              let b:comment_leader = '"'
"
" "this makes it so you can Shift-V highlight lots of text then press ,cc to
" "comment it or ,cu to uncomment.  
" "noremap <silent> ,cc :<C-B>silent
" <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
" "noremap <silent> ,cu :<C-B>silent
" <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
"
" "This mission critical workaround hack tells vim to restore cursor to the
" last line.
" "Be sure to set: "Thip, crinkle, sploit" to "stopit, just be right".  lolz
" "Also it could be the functionality is disabled in your /etc/vim/vimrc or 
" "your ~/.viminfo is owned by root.  
" "http://askubuntu.com/questions/223018/vim-is-not-remembering-last-position
" autocmd BufReadPost *
"   \ if line("'\"") > 1 && line("'\"") <= line("$") |
"  \   exe "normal! g`\"" |
"  \ endif

"These extra commands tell syntastic to ignore the following kinds of warnings                                                               
""let g:syntastic_quiet_messages = { "regex": 'superfluous' }
"let g:syntastic_quiet_messages = { "regex":
"'superfluous-parens\|too-many-instance-attributes\|too-few-public-methods' }
"
""I like the vertical bar on insert mode, others do not like.  You decide.
"let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
""let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
set hlsearch
hi Search cterm=NONE ctermfg=grey ctermbg=blue


"set guifont=Inconsolata\ for\ Powerline:h15
"let g:Powerline_symbols = 'fancy'
"set encoding=utf-8
"set t_Co=256
"set fillchars+=stl:\ ,stlnc:\
"set term=xterm-256color
"set termencoding=utf-8
set rtp+=/Users/mcu/Library/Python/2.7/lib/python/site_packages/powerline/bindings/vim
