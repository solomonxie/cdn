set t_Co=256 "For Windows
let g:airline#extensions#tabline#enabled = 1  "Enable airline
let g:airline_powerline_fonts=1 "Essential
set laststatus=2  "2:always show
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
" @airline-extension-theme
    "let g:airline_theme='gruvbox'  "grubox|deus|badwolf|solarized
    let g:airline_theme='bubblegum' "Default
    " let g:shades_of_purple_airline = 1
    " let g:airline_theme='shades_of_purple'
" @airline-extensions-tabline-tabs
    "   -> Options default|jsformatter|unique_tail|unique_tail_improved|short_path
    let g:airline#extensions#tabline#formatter='unique_tail'
    let g:airline#extensions#tabline#switch_buffers_and_tabs=0
    let g:airline#extensions#tabline#enabled=1  "enable tabline
    let g:airline#extensions#tabline#tabs_label='TABS'
    let g:airline#extensions#tabline#show_tab_nr=0 "enable tag number
    let g:airline#extensions#tabline#tab_nr_type=1 "Numbers shown
    "let g:airline#extensions#tabline#left_sep = ' '  "separater
    "let g:airline#extensions#tabline#left_alt_sep = '|'  "separater
" @airline-extension-tabline-buffers
    let g:airline#extensions#tabline#show_buffers=1
    let g:airline#extensions#tabline#buffers_label='BUFFERS'
    let g:airline#extensions#tabline#buffer_nr_show=0
    let g:airline#extensions#tabline#buffer_idx_mode=0
    "let g:airline#extensions#tabline#buffer_idx_format={}
" @airline-extensions-tabline-splits
    let g:airline#extensions#tabline#show_splits=1 "show split

" https://github.com/vim-airline/vim-airline
" [ SHOULD BE LOADED AFTER SETTINGS ]
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'