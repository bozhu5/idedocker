:set mouse=a

" hjkl movement in insert mode
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
      set pastetoggle=<Esc>[201~
        set paste
          return ""
      endfunction


"PEP 8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Whitespace
"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred"
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF 8 encoding
set encoding=utf-8

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" python virtual env support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
      project_base_dir = os.environ['VIRTUAL_ENV']  
      activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
      execfile(activate_this, dict(__file__=activate_this))
EOF
