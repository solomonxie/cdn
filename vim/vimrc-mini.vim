" -------------[ MINIMUM VIMRC ]---------------
"
" MAINTAINER: Solomon Xie <solomonxiewise@gmail>
" Enviroment: Raspbian
"
" Performance:
"   vim --startuptime /tmp/vim-startup-time.log +qall && cat /tmp/vim-startup-time.log |sort -nrk 2
"   "or
"   :Startuptime


" [  Import Modules  ]-----------{
    "source ~/dotfiles/vim/vimrc-plugins
    source ~/dotfiles/vim/vimrc-keymappings
    "source ~/dotfiles/vim/vimrc-ui
" }


" [  Plugins Manager vim-plug  ]-----------------------------------{
    call plug#begin('~/.vim/plugged')
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
        Plug 'tpope/vim-obsession'  "For Tmux to restore VIM sessions
        Plug 'tweekmonster/startuptime.vim'   "VIM loading analysis
    call plug#end()
    "[Plugin Settings]
        "<vim-obsession>
        function! AutoObsession()
            if bufnr('%') >= 3
                :Obsession /tmp/obsession.vim
            endif
        endfunction
        autocmd VimLeave * call AutoObsession()
        "<fzf>
        let g:fzf_layout = { 'down': '~40%' }
" }



" [  General Builtin Settings  ]-----------{
    set nocompatible   " be iMproved, required
    "set spell spelllang=en,en_us,cjk  "Spell check [Ugly]
    "set nospell
    set ignorecase "Case Insensitive
    set ignorecase   "搜索时忽略大小写
    set smartcase  "搜索时如果输大写, 就不再忽略大小写
    set hidden " 设置Buffer缓冲区允许不保存时切换buffer
    set number "show line number
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
" }


" [  Advanced Builtin Settings  ]-----------{
    "<Folding>
    set foldenable              " 开始折叠
    set foldmethod=syntax       " 设置语法折叠
    set foldnestmax=1
    set foldcolumn=0            " 设置折叠区域的宽度
    setlocal foldlevel=1        " 设置折叠层数
    set foldlevelstart=99       " 打开文件是默认不折叠代码
    "set foldclose=all          " 设置为自动关闭折叠

    "<Buffer>
        autocmd BufEnter * cd %:p:h  "进入Buffer后自动把pwd改为文件所在目录
" }


" [  UI / Color Scheme  ]---------{
    " <Basic Settings>
        set t_Co=256   ">> Overwriting Alert !!
        set background=dark   ">> Overwriting Alert !!
        set cursorline  "Highlighting current line
        set fillchars+=vert:\!  "Bar character for VERTical Split Pane
        autocmd WinEnter * set cursorline
        autocmd WinLeave * set nocursorline

    " <Line Number>
        " turn hybrid line numbers on
        set number relativenumber
        set nu rnu
        " Automatic toggling between line number modes
        augroup numbertoggle
          autocmd!
          autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
          autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
        augroup END

    " <Color Scheme>  --> Overwriting Alert!
        "set termguicolors   " -> !! NOT WORKING in Tmux through SSH
        set term=screen-256color
        colorscheme monokai "Fast (sickill/vim-monokai)
        highlight Normal ctermbg=NONE
        highlight nonText ctermbg=NONE

    " [  Search Highlighting  ]-----------{
        "
            set incsearch
            set hlsearch
        " >>
            highlight Search guibg='Purple' guifg='NONE'
            highlight IncSearch gui=underline,bold guifg=White guibg=Red3
            "highlight IncSearch ctermbg=black ctermfg=yellow
        " 鼠标无动作时取消高亮
            autocmd cursorhold * set nohlsearch
        " 括号匹配自动高亮
            "highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE"
    " }
" }


" [  Builtin Autocomplete (omnifunc) ] ----{
        "au FileType python setl ofu=pythoncomplete#CompletePHP
        "au FileType php setl ofu=phpcomplete#CompletePHP
        "au FileType ruby,eruby setl ofu=rubycomplete#Complete
        "au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
        "au FileType c setl ofu=ccomplete#CompleteCpp
        "au FileType css setl ofu=csscomplete#CompleteCSS
" }


" [  Abbreviations  ]--------{
    " Test
        iabbrev waht what
        iabbrev tehn then
" }

" [  Variables  ]-----------{
    "let has_mac = has('mac')
    "let has_vim = has('vim')
    "let has_nvim = has('nvim')
    "let has_lua = has('lua')
    "let has_ruby = has('ruby')
    "let has_py2 = has('python2')  "=> Careful, super slow
    "let has_py3 = has('python3')  "=> Careful, super slow
    "let arch = system("uname -m")
    "if arch == 'armv7l'
    "    let has_rpi = 1
    "elseif arch == 'x86_64'
    "    let has_pc = 1  "Mac / PC
    "endif
" }



" Disable parentheses matching depends on system.
" This way we should address all cases (?)
" set noshowmatch
" NoMatchParen " This doesnt work as it belongs to a plugin,
" which is only loaded _after_ all files are.
" Trying disable MatchParen after loading all plugins
"
function! g:FuckThatMatchParen ()
    if exists(":NoMatchParen")
        :NoMatchParen
    endif
endfunction

augroup plugin_initialize
    autocmd!
    autocmd VimEnter * call FuckThatMatchParen()
augroup END

" [  Swap files  ]--------{
    set swapfile    "enable swap file
    set directory=/tmp    "set swp file directory.
    set updatecount=20     "save swp file every amount of characters
    " ▼ update also check cursor-holds and other functions, bit expensive one.
    set updatetime=4000   "save swap file every amount of ms
" }


" [  Persistent undo  ]--------{
    set undofile "Maintain UNDO history between sessions
    set undodir=/tmp/undo
    if !isdirectory(&undodir)
       silent! call mkdir(&undodir, 'p')
    endif
" }
