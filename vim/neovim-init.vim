" Owner: Solomon Xie
" Email: solomonxiewise@gmail.com
" Enviroment: MacOS Sierra / Raspbian / Ubuntu
" Preload dependencies:
"     # [Plugins Manager: Vundle]
"       $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"     # [Plugin dependencies]
"       $ brew install ctags
"       $ brew install --HEAD universal-ctags/universal-ctags/universal-ctags
"     # [Python dependencies]
"       $ pip install neovim jedi psutil setproctitle
" Manual commands (type in vim, sodu mode required):
"     :PluginInstall


let g:python3_host_prog = '/Users/Jason/virtualenv/venv-neovim/bin/python'


" [ Plugin Manager vim-plug ] ======= {{{
"call plug#begin('~/.vim/plugged')
"    "<< nvim-completion-manager >>
"    Plug 'ncm2/ncm2'
"    Plug 'roxma/nvim-yarp'
"    Plug 'ncm2/ncm2-bufword'
"    Plug 'ncm2/ncm2-tmux'
"    Plug 'ncm2/ncm2-path'
"call plug#end()
" }}}}


" [VUNDLE DIFINITIONS MUST BE ON THE TOP]
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    "<<STATUS-BAR>>
        "Plugin 'itchyny/lightline.vim' "beautiful status line
        "Plugin 'Lokaltog/vim-powerline' "fancy status line (python needed)
        Plugin 'vim-airline/vim-airline'
        Plugin 'vim-airline/vim-airline-themes'
    "<<Git>>
        "Plugin 'tpope/vim-fugitive'    " easy commands to do git
    "<<File Browsing>>
        " NERDTREE
        Plugin 'scrooloose/nerdtree'          " File tree manager
        Plugin 'Xuyuanp/nerdtree-git-plugin'  " display git status within Nerdtree
        Plugin 'jistr/vim-nerdtree-tabs'      " enhance nerdtree's tabs
        Plugin 'ryanoasis/vim-devicons'       " add beautiful icons besides files
        "Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " enhance devicons
        " COMMAND-T
        Plugin 'wincent/command-t'
    "<<Snippets>> (python required)
        Plugin 'MarcWeber/vim-addon-mw-utils'
        Plugin 'tomtom/tlib_vim'
        Plugin 'garbas/vim-snipmate'
        "Plugin 'honza/vim-snippets' "some common snippets (python)
    "<<Search-Tools>>
        "Plugin 'easymotion/vim-easymotion'
    "<<Syntax>>
        "Plugin 'vim-syntastic/syntastic'
    "<<Surround>>
        "Plugin 'tpope/vim-surround'
    "<<Session>>
        Plugin 'tpope/vim-obsession'
    "<<Autocomplete>>
        "Plugin 'ervandew/supertab'
        "Plugin 'valloric/youcompleteme'   "Not working
        Plugin 'davidhalter/jedi-vim'
    "<<Tags>>
        Plugin 'majutsushi/tagbar'
    "<<Folding>>
        Plugin 'tmhedberg/SimpylFold'
    "<<Indentation>>
        "Plugin 'nathanaelkane/vim-indent-guides'
        Plugin 'Yggdroot/indentLine'
    "<<Language-Specific>>
        "Plugin 'python-mode/python-mode'
    "<<nvim-completion-manager>>
    Plugin 'roxma/nvim-completion-manager'
    "Plugin 'ncm2/ncm2'
    "Plugin 'roxma/nvim-yarp'
    "Plugin 'ncm2/ncm2-bufword'
    "Plugin 'ncm2/ncm2-tmux'
    "Plugin 'ncm2/ncm2-path'
call vundle#end()


" General Settings ==================={{{
    filetype plugin indent on    " [Essential]
    set nocompatible   " be iMproved, required
    "colorscheme gruvbox 
    syntax enable 
    set ignorecase "Case Insensitive
    set smartcase  "Also detects specified case
    set background=dark
    set hidden " 设置Buffer缓冲区允许不保存时切换buffer
    set number "show line number
    set cursorline "highlight current line with cursor on
    set mouse=a  "设置鼠标滚动为All，即在tmux中的vim也能滚动 （但是选中文字自动会进入Visual模式）
    "set paste   "设置可以直接用ctrl+c ctrl+v复制粘贴 其实没什么区别 只不过不用在insert模式而已
    set showcmd " show keypress at right-bottom
    set backspace=2 "backspace over everything in insert mode
    set autoindent "换行时自动缩排 同时对应的还有其它两种模式 smartindent, cindent
    set tabstop=4 "设定tab宽度为4个字符
    set shiftwidth=4 "设定自动缩进为4个字符
    set expandtab "用space替代tab的输入 取消的话 就用set noexpandtab "不用space替代tab的输入
    set encoding=utf8  "设置默认编码
    retab "打开文件时自动转换所有tab为空格
" }}}


" Advanced Settings ========================{{{
    "<Taging>
    set tags=tags  "Plugin: Ctags  
    "<Folding>
    set foldenable              " 开始折叠
    set foldmethod=syntax       " 设置语法折叠
    set foldnestmax=1
    set foldcolumn=0            " 设置折叠区域的宽度
    setlocal foldlevel=1        " 设置折叠层数
    "set foldlevelstart=99       " 打开文件是默认不折叠代码
    "set foldclose=all          " 设置为自动关闭折叠
    " 用空格键来开关折叠
    "nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
    nnoremap <return> za
" }}}


" Filetype based builtin Autocomplete [omnifunc] --{
    filetype plugin on
    "au FileType python setl ofu=pythoncomplete#CompletePHP
    "au FileType php setl ofu=phpcomplete#CompletePHP
    "au FileType ruby,eruby setl ofu=rubycomplete#Complete
    "au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
    "au FileType c setl ofu=ccomplete#CompleteCpp
    "au FileType css setl ofu=csscomplete#CompleteCSS
" }


" Key Mapping ================{{{
    "<Leader key>
        let mapleader = ','
    "<Plugins>
        nnoremap <leader>i :PluginInstall<CR>
    "<Escape key>
        inoremap <C-c> <Esc>:nohl<CR><ESC>
        nnoremap <C-c> <ESC>:nohl<CR><ESC>
    "<Clipboard>
        " 复制到系统剪切板
        nnoremap <leader>y "+Y
        vnoremap <leader>y "+y
        " 从系统剪切板中粘贴到当前位置
        nnoremap <leader>p "+P
        vnoremap <leader>p "+p
    "<Buffer>
        nnoremap <C-h> :bp<CR><ESC>
        nnoremap <C-l> :bn<CR><ESC>
        nnoremap <leader>q :bd<CR><ESC>
    "<Tagging>
        nnoremap <C-t> :TagbarToggle<CR>
    "<Folding>
        nnoremap <return> za
        vnoremap <space> zf
    "<Filetype based Mappings>----{
        " Get current filetype -> :echo &filetype or as variable &filetype
        " [ Builds / Compiles / Interpretes  ]
        "<C Compiler>
        autocmd FileType c nnoremap <buffer> <C-i> :!gcc % && ./a.out <CR>
        "<C++ Compiler>
        autocmd FileType cpp nnoremap <buffer> <C-i> :!g++ % && ./a.out <CR>
        "<Python Interpreter>
        autocmd FileType python nnoremap <buffer> <C-i> :!python % <CR>
        "<Bash Script>
        autocmd FileType sh nnoremap <buffer> <C-i> :!sh % <CR>
        "<RCs> (Configs)
        autocmd FileType vim,tmux nnoremap <buffer> <C-i> :source % <CR>
        autocmd FileType zsh nnoremap <buffer> <C-i> :!source % <CR>
        "<Executable>
        "nnoremap <buffer> <C-i> :!./% <CR>
        "nnoremap <buffer> <C-i> :! %:p <CR>
    " }

    "--Autocomplete--
    " vim自带的自动补全Autocomplete [omnifunc]
        inoremap <C-d> <C-x><C-l>
        "inoremap ' ''<Esc>i
        "inoremap " ""<Esc>i
        "inoremap ( ()<Esc>i
        "inoremap [ []<Esc>i
        "inoremap { {}<Esc>i
    
    "--Nerdtree--
    " 将焦点放在树上（无论何种情况）
        nnoremap <leader>f :NERDTreeFocus<CR>
    " 开/关文件菜单
        nnoremap <C-f> :NERDTreeToggle<CR>  
    " 向右向左切换tab
        "nnoremap <leader>l gt
        "nnoremap <leader>h gT
    " 按leader+t 打开新tab
        "nnoremap <leader>t :tabe<CR>
    " 按leader+q 关闭当前tab
        "nnoremap <leader>c :tabc
" }}}



" Search Highlighting -----------{{{
    " >>
        highlight Search guibg='Purple' guifg='NONE'
        highlight IncSearch gui=underline,bold guifg=White guibg=Red3
        "highlight IncSearch ctermbg=black ctermfg=yellow 
    " 鼠标无动作时取消高亮
        autocmd cursorhold * set nohlsearch
    " 当输入查找命令时，再启用高亮
        noremap n :set hlsearch<cr>n
        noremap N :set hlsearch<cr>N
        noremap / :set hlsearch<cr>/
        noremap ? :set hlsearch<cr>?
        noremap * *:set hlsearch<cr>
    " 括号匹配自动高亮
        "highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE"
" }}}


" Swap files (for recovery) --------{{{
    set swapfile    "enable swap file
    set directory=/tmp    "set swp file directory. 
    set updatecount=20     "save swp file every amount of characters
    " ▼ update also check cursor-holds and other functions, bit expensive one.
    set updatetime=4000   "save swap file every amount of ms
" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==============================PLUGIN SETTINGS=================================
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" <nvim-completion-manager>-----{
    " enable ncm2 for all buffers
    "autocmd BufEnter * call ncm2#enable_for_buffer()
    " IMPORTANTE: :help Ncm2PopupOpen for more information
    "set completeopt=noinsert,menuone,noselect
" }


" <IndentLine>--------{
    let g:indentLine_enabled = 1
    let g:indentLine_char='│'
    let g:indentLine_conceallevel = 2
    let g:indentLine_color_term = 239
    let g:indentLine_concealcursor = 'inc'
    "let g:indentLine_setColors = 0
    "let g:indentLine_setConceal = 0
" }


" <SimpylFold>------------{
    let g:SimpylFold_docstring_preview = 1
" }


" <Python-Mode>-------{
    "let g:pymode_python = 'python3'
" }

" <Vim-Indent-Guides>----------------------{
    "let g:indent_guides_enable_on_vim_startup = 1
    "set ts=1 sw=1 et
    "let g:indent_guides_start_level=2
    "let g:indent_guides_size=1
    "hi IndentGuidesOdd  ctermbg=black
    "hi IndentGuidesEven ctermbg=darkgrey
" }


" <Status-Line>-----------{
    " @airline
        set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩
        let g:airline#extensions#tabline#enabled = 1   " 是否打开tabline
    "这个是安装字体后 必须设置此项" 
        let g:airline_powerline_fonts = 1
        set laststatus=2  "永远显示状态栏
        let g:airline_theme='bubblegum' "选择主题
        let g:airline#extensions#tabline#enabled=1  "显示窗口tab和buffer
        "let g:airline#extensions#tabline#left_sep = ' '  "separater
        "let g:airline#extensions#tabline#left_alt_sep = '|'  "separater
        "let g:airline#extensions#tabline#formatter = 'default'  "formater
        let g:airline_left_sep = '▶'
        let g:airline_left_alt_sep = '❯'
        let g:airline_right_sep = '◀'
        let g:airline_right_alt_sep = '❮'
        "let g:airline_symbols.linenr = '¶'
        "let g:airline_symbols.branch = '⎇'
    " @lightline
        "set laststatus=2 " startup the lightline.vim 
        "let g:lightline = { 'colorscheme': 'powerline', } 
        "set status-line's color scheme
    " @powerline
        "set laststatus=2
        "set t_Co=256
        "let g:Powerline_symbols= 'unicode'
        "set encoding=utf8
" } 


" <Nerdtree>-----------------------------------{
    ">>
        "let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
        "let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
    " 自动开启Nerdtree
        "autocmd vimenter * NERDTree  
    " 从nerdtree上打开文件后菜单自动关闭
        let NERDTreeQuitOnOpen=1
    "打开vim时如果没有文件自动打开NERDTree
        autocmd vimenter * if !argc()|NERDTree|endif
    "当NERDTree为剩下的唯一窗口时自动关闭
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    " 不显示隐藏文件
        let g:NERDTreeHidden=1
    " 过滤: 所有.pyc文件不显示
        let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']  
    " 美化菜单 不显示多余的东西
        let NERDTreeMinimalUI = 1
        let NERDTreeDirArrows = 1
    "设置树的显示图标
        let g:NERDTreeDirArrowExpandable = '▸'
        let g:NERDTreeDirArrowCollapsible = '▾'
    "let g:NERDTreeShowLineNumbers=1  " 显示菜单上行号

    "NERDTREE-GIT
    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
    \ }

    "NERDTree-Tabs
        "let g:nerdtree_tabs_open_on_console_startup=1 "设置打开vim的时候默认打开tabs
    "Nerdtree-devicons
        "set guifont=DroidSansMono_Nerd_Font:h11
    "Nerdtree-syntax-highlighting
        "let g:NERDTreeDisableFileExtensionHighlight = 1
        "let g:NERDTreeDisableExactMatchHighlight = 1
        "let g:NERDTreeDisablePatternMatchHighlight = 1
        "let g:NERDTreeFileExtensionHighlightFullName = 1
        "let g:NERDTreeExactMatchHighlightFullName = 1
        "let g:NERDTreePatternMatchHighlightFullName = 1
        "let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
        "let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
        "let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
" }
