" vundle {
    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    Plugin 'goirijo/vim-jgg-colorscheme'
    Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
    Plugin 'TeX-PDF'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'gerw/vim-HiLinkTrace'
    Plugin 'Command-T'
    Plugin 'bling/vim-airline'
    Plugin 'fugitive.vim'
    Plugin 'magic-dot-files/TagHighlight'
    Plugin 'Tagbar'
    Plugin 'EasyMotion'
    Plugin 'freitass/todo.txt-vim'
    Plugin 'tpope/vim-abolish'
    Plugin 'matchit.zip'

    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    
    "Plugin 'ctags.vim'
    "Plugin 'vimlatex'
    "Plugin 'taglist.vim'
    "Plugin 'GetLatestVimScripts'
    "Plugin 'vim-misc'
    "Plugin 'easytags.vim'
    "Plugin 'blueyed/vim-diminactive'
    "Plugin 'nacitar/terminalkeys.vim'
    
    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line

" }

" taghighlight {
  let g:CtagsExtraArguments=['--fields=+l', '--list-kinds=c++']
" }

" tagbar {
let g:tagbar_type_cpp = {
            \ 'kinds' : [
            \ 'd:macros:1',
            \ 'g:enums',
            \ 't:typedefs:0:0',
            \ 'e:enumerators:0:0',
            \ 'n:namespaces',
            \ 'c:classes',
            \ 's:structs',
            \ 'u:unions',
            \ 'f:functions',
            \ 'm:members:0:0',
            \ 'v:global:0:0',
            \ 'x:external:0:0',
            \ 'l:local:0:0'
            \ ]
            \ }  
" }

" ultisnips {
  set runtimepath+=~/.dotfiles/
  let g:UltiSnipsSnippetsDir="~/.dotfiles/UltiSnips"
"  let g:UltiSnipsSnippetDirectories=["~/.dotfiles/UltiSnips"]
  let g:UltiSnipsExpandTrigger="<f5>"
  "let g:UltiSnipsJumpForwardTrigger="<c-b>"
  "let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }
" airline {
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  set laststatus=2
  let g:airline_theme='wombat'
  "let g:airline_left_sep=''
  "let g:airline_right_sep=''
  "set noshowmode
" }

" youcompleteme stuff {
    "set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_register_as_syntastic_checker = 1
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_confirm_extra_conf = 0    "Just don't be dumb
" }

" easytags {
    "let g:easytags_updatetime_warn=0
    "let g:easytags_python_enabled=1
    "let g:easytags_syntax_keyword='always'
    "let g:easytags_by_filetype="./.tags"
    "let g:easytags_async=1
    "let g:easytags_on_cursorhold = 1
    "let g:easytags_auto_update = 0
    "let g:easytags_events = ['BufWritePost']
    "set regexpengine=1
"}

    " General {
    "folding stuff
    colorscheme jgg
    set foldmethod=syntax
    set foldlevelstart=2

    set background=dark         " Assume a dark background
    syntax on 					" syntax highlighting
    "set mouse=a					" automatically enable mouse usage
    scriptencoding utf-8

    set autowrite                  " automatically write a file when leaving a modified buffer
    set history=1000  				" Store a ton of history (default is 20)
    set spell 		 	        	" spell checking on

    "set backup 						" backups are nice ...
    " }

    " Vim UI {
    "if &term =~ '256color'
        " disable Background Color Erase (BCE) so that color schemes
        " render properly when inside 256-color tmux and GNU screen.
        " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
        set t_ut=
    "endif
   
    "load tags
    set tags+=./tags
    "Remember where I was
    if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif
    
    colorscheme jgg
    
    set backspace=indent,eol,start  " backspace for dummies
    
    set linespace=0                 " No extra spaces between rows
    set number
    set relativenumber              " Line numbers on. but relative
    set showmatch                   " show matching brackets/parenthesis
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms
    set winminheight=0              " windows can be 0 line high.
    set ignorecase                  " case insensitive search
    set smartcase                   " case sensitive when uc present
    "set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\%l
    set laststatus=2
    set hidden
"}

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

" Formatting {
    "	set nowrap                     	" wrap long lines
    set autoindent                 	" indent at the same level of the previous line
    set shiftwidth=4               	" use indents of 4 spaces
    set expandtab 	  	     		" tabs are spaces, not tabs
    set tabstop=4 					" an indentation every four columns
    set softtabstop=4 				" let backspace delete indent
    "filetype plugin indent on
    "set matchpairs+=<:>            	" match, to be used with %
    command Stylize execute "%! astyle"
    nnoremap <leader>a :Stylize<CR>


"}

" Needs moar macros {
    source /usr/share/vim/vim74/ftplugin/man.vim
"}

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }
