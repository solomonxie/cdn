""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                LINTER: ALE                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'

let g:ale_completion_enabled = 0  "Disable completion
let g:airline#extensions#ale#enabled = 1  "Enable error message in AirLine

let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_set_highlights = 1
let b:ale_warn_about_trailing_whitespace = 1

" Only lint on save
let g:ale_lint_on_text_changed = 'always'  "never|always
" let g:ale_lint_on_insert_leave = 0
" let g:ale_lint_on_enter = 0

" Quickfix (:copen to open quickfix list)
let g:ale_set_quickfix = 1
let g:ale_open_list = 1  "Enable auto-open quickfix when error occurs
let g:ale_keep_list_window_open = 0  "Auto-close quickfix when no error
let g:ale_list_window_size = 5
let g:ale_set_loclist = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  LINTERS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Available Linters:
" https://github.com/dense-analysis/ale/tree/master/ale_linters
let g:ale_linters_explicit = 1  "Only run linters when I specify
" Make it 'g:' to only run linters I specified
let g:ale_linters = {
\   'sh': ['shell'],
\   'python': ['flake8'],
\   'make': ['checkmake'],
\   'vim': ['vint'],
\   'dockerfile': ['dockerfile_lint'],
\ }
" let b:ale_fixers = {
" \   'python': ['autopep8'],
" \   'c++': ['clang', 'gcc']
" \}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   FIXERS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

