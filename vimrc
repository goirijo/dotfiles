" vundle {
    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'gmarik/vundle'
    
    Plugin 'goirijo/vim-jgg-colorscheme'
    Plugin 'ctags.vim'
    Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
    "Plugin 'vimlatex'
    Plugin 'TeX-PDF'
    "Plugin 'taglist.vim'
    "Plugin 'GetLatestVimScripts'
    Plugin 'vim-misc'
    "Plugin 'easytags.vim'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'TagHighlight'
    Plugin 'flazz/vim-colorschemes'
    "Plugin 'blueyed/vim-diminactive'
    Plugin 'gerw/vim-HiLinkTrace'
    Plugin 'nacitar/terminalkeys.vim'
    Plugin 'Command-T'

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

" youcompleteme stuff {
    set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_register_as_syntastic_checker = 1
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
    set backspace=indent,eol,start  " backspace for dummys                                                                                      
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " show matching brackets/parenthesis
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms
    set winminheight=0              " windows can be 0 line high.
    set ignorecase                  " case insensitive search
    set smartcase                   " case sensitive when uc present
    set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\%l
    set laststatus=2
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
    filetype plugin indent on
    "set matchpairs+=<:>            	" match, to be used with % 
"}

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }

" Needs moar macros {
    source /usr/share/vim/vim74/ftplugin/man.vim
"}
