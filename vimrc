" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
    Plug 'ycm-core/YouCompleteMe'
    Plug 'vim-latex/vim-latex'
    Plug 'wincent/command-t'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'gerw/vim-HiLinkTrace'
    " Plug 'arakashic/chromatica.nvim'
    Plug 'jeaye/color_coded'
    Plug 'arakashic/chromatica.nvim'
    Plug 'morhetz/gruvbox'
    " Plug 'majutsushi/tagbar'  "clashes with ycm
    Plug 'freitass/todo.txt-vim'
    Plug 'tpope/vim-fugitive'
    " Plug 'christoomey/vim-conflicted'
    " Plug 'whiteinge/diffconflicts'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-surround' 
    Plug 'tpope/vim-repeat' 
    Plug 'tpope/vim-commentary' 
    Plug 'jlanzarotta/bufexplorer'
    Plug 'Konfekt/FastFold'   "fold=syntax slows vim down a LOT
    Plug 'vim-scripts/LargeFile'
    Plug 'vim-scripts/DoxygenToolkit.vim'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'mindriot101/vim-yapf'
    Plug 'rhysd/vim-clang-format'
    Plug 'mileszs/ack.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'joshdick/onedark.vim'
    Plug 'tomasr/molokai'
    Plug 'sonph/onehalf'
    Plug 'gosukiwi/vim-atom-dark'
    Plug 'nanotech/jellybeans.vim'
    " Plugin 'lyuts/vim-rtags'
    " Plugin 'gioele/vim-autoswap'
    " Plugin 'gauteh/vim-cppman'
    " Plugin 'EasyMotion'
    " Plugin 'TeX-PDF'
    " Plugin 'gerw/vim-HiLinkTrace'
    " Plugin 'junegunn/vim-peekaboo'
    " Plugin 'ludwig/split-manpage.vim'
     " Plugin 'vim-utils/vim-man'
    "Plugin 'GetLatestVimScripts'
    "Plugin 'vim-misc'
    "Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
    "Plugin 'matchit.zip'
    "Plugin 'bbchung/clighter'
    "Plugin 'xolox/vim-easytags'
    "Plugin 'xolox/vim-misc'
    "Plugin 'lh-cpp'
    "Plugin 'NigoroJr/color_coded-colorschemes'
    "Plugin 'JBakamovic/yaflandia'
    "Plugin 'magic-dot-files/TagHighlight'
    "Plugin 'CSApprox'
    "Plugin 'guicolorscheme.vim'
    "Plugin 'ctags.vim'
    "Plugin 'vimlatex'
    "Plugin 'taglist.vim'
    "Plugin 'easytags.vim'
    "Plugin 'blueyed/vim-diminactive'
    "Plugin 'nacitar/terminalkeys.vim'
call plug#end()

" This might hurt some plugins
"    set autochdir

" vim-maximizer{
" Maximize window with F3
" nnoremap <silent><F3> :MaximizerToggle<CR>        "These are the default
" vnoremap <silent><F3> :MaximizerToggle<CR>gv
" inoremap <silent><F3> <C-o>:MaximizerToggle<CR>
" }

" vim-yapf{
let g:yapf_style = "google"
" }

" vim-clang-format{
let g:clang_format#code_style = "llvm"
let g:clang_format#detect_style_file = 1
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "ColumnLimit" : "140",
            \ "PointerAlignment" : "Left",
            \ "BinPackParameters" : "false",
            \ "ConstructorInitializerAllOnOneLineOrOnePerLine" : "true",
            \ "IndentWidth"  :     4,
            \ "BreakBeforeBraces" : "Allman"}
" }

" vim-latex{
filetype plugin on
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
let g:Tex_IgnoredWarnings =
            \"Underfull\n".
            \"Overfull\n".
            \"specifier changed to\n".
            \"You have requested\n".
            \"Missing number, treated as zero.\n".
            \"There were undefined references\n".
            \"Citation %.%# undefined\n".
            \"Label(s) may have changed\n".
            \"A float is stuck \n".
            \"option without twoside option is"
let g:Tex_IgnoreLevel=10

" For when you want to switch to XeTeX
function SetXeTex()
        let g:Tex_CompileRule_pdf = 'xelatex -aux-directory=F:/Vim/my_latex_doc/temp --synctex=-1 -src-specials -interaction=nonstopmode $*'
    endfunction
    map <Leader>lx :<C-U>call SetXeTex()<CR>

" }

" fugitive {
    " nnoremap dgh :diffget //2<CR>
    " nnoremap dgl :diffget //3<CR>

    set diffopt+=vertical
    " set diffopt+=iwhite
    " set diffexpr=""
"}

" color_coded {
 let g:color_coded_filetypes = ['cc', 'hh', 'hpp', 'c', 'cpp', 'objc']
" }


" command-t {   "
       set wildignore+=*.ii,*.o,*.os,*.s,*.orig,.git,build/*,*.pyc,*.pyo
       let g:CommandTTraverseSCM = 'pwd'

       "Don't jump to the previous tab!!
       let g:CommandTAcceptSelectionCommand = 'e'
       " let g:CommandTAcceptSelectionSplitCommand = 'sp'
       " let g:CommandTAcceptSelectionTabCommand = 'CommandTOpen tabe'
       " let g:CommandTAcceptSelectionVSplitCommand = 'vs'
" }

" taghighlight {
  let g:CtagsExtraArguments=['--fields=+l', '--list-kinds=c++']
" }

" tagbar {
nmap <F8> :TagbarToggle<CR>
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
  let g:ultisnips_python_style="numpy"
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
  let g:airline_left_sep=''
  "let g:airline_right_sep=''
  "set noshowmode
" }

" youcompleteme stuff {
    " set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
    " let g:ycm_collect_identifiers_from_tags_files = 0
    " let g:ycm_seed_identifiers_with_syntax = 1
    " let g:ycm_register_as_syntastic_checker = 1
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_confirm_extra_conf = 0    "Just don't be dumb
    let g:ycm_disable_for_files_larger_than_kb = 100
    map <F9> :YcmCompleter FixIt<CR>
    map <Leader><Leader>a :YcmCompleter GoToDeclaration<CR>
    map <Leader><Leader>s :YcmCompleter GoToDefinition<CR>
    " let g:ycm_python_binary_path = 'python'

	"Stuff you want done after calling YcmDiags
	function! s:CustomizeYcmLocationWindow()
	  " Go to previous window.
	  wincmd p
	endfunction

	autocmd User YcmLocationOpened call s:CustomizeYcmLocationWindow()

    "Aren't I cool?
    let g:ycm_error_symbol="🗙"
    let g:ycm_warning_symbol="⚠️"

    " sign define YcmError text=xx
    " sign define YcmWarning text=
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

" fastfold {
    "set foldmethod=syntax
" }
    " General {
    "folding stuff
    set foldlevelstart=2
    set foldmethod=syntax

    let g:gruvbox_italic=1
    " let g:gruvbox_contrast_dark = 'hard'
    set t_Co=256
    colorscheme gruvbox
    set background=dark         " Assume a dark background
    syntax on 					" syntax highlighting
    "set mouse=a					" automatically enable mouse usage
    scriptencoding utf-8

    set autowrite                  " automatically write a file when leaving a modified buffer
    set history=1000  				" Store a ton of history (default is 20)
    set spell 		 	        	" spell checking on

    autocmd FileType cpp set keywordprg=cppman

    "set backup 						" backups are nice ...
    " }

    " Vim UI {
    "if &term =~ '256color'
        " disable Background Color Erase (BCE) so that color schemes
        " render properly when inside 256-color tmux and GNU screen.
        " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
        set t_ut=
        "set term=screen-256color
    "endif
   
    "load tags
    set tags+=./tags
    "Remember where I was
    if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif
    
    set matchpairs+=<:>
    
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
    command CountInsert %s/^/\=line('.')."\t"/
    "nnoremap <leader>a :Stylize <bar> :set foldmethod=syntax<CR>
    nnoremap <leader>a :ClangFormat<CR>

    au BufNewFile,BufRead Makemodule.am set filetype=automake
    au BufNewFile,BufRead *.cxpy set filetype=cpp

"}

" NERDtree {
    map <F7> :NERDTreeToggle<CR>
" }

" Needs moar macros {
filetype plugin on
runtime macros/matchit.vim
"}

" Use local vimrc if available {
    if filereadable(glob("./.vimrc.local"))
        source ./.vimrc.local
    endif
    if filereadable(glob("./vimrc.local"))
        source ./vimrc.local
    endif
" }

