" https://github.com/vim-syntastic/syntastic

if has('python') || has('python3')
    Plug 'vim-syntastic/syntastic' "Static Code Check
    " Plug 'mgedmin/coverage-highlight.vim'
endif

if &runtimepath =~ 'syntastic'
    let g:syntastic_enable_signs = 1
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_check_on_open = 1
    let g:syntastic_loc_list_height = 5
    highlight SyntasticErrorSign guifg=white guibg=black
    "let g:syntastic_check_on_wq = 0
    " [CHECKERS]
        " Python (pyflakes is faster than pylint)
        let g:syntastic_python_checkers=['flake8']
        " Clang
        let g:syntastic_cpp_checkers = ['gcc']
        let g:syntastic_cpp_compiler = 'gcc'
endif