"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Insert current datetime when typing 25/06/19 22:01:37
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
" Insert PDB statement


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au FileType python map <buffer> <leader>C ?class \| :nohl<CR>w
au FileType python map <buffer> <leader>D ?def \| :nohl<CR>w

au FileType python iab pdb __import__('pdb').set_trace()
au FileType python iab ipdb __import__('ipdb').set_trace()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType fish,sh,rst,md,html,xml,javascript,css,scss,sass,less,scss.css,yaml,yml,rst,md,sshconfig setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType fish,sh,html,xml,javascript,css,scss,sass,less,scss.css,yaml,yml setlocal iskeyword+=-

autocmd BufNewFile,BufRead *.pt,*.zcml setlocal iskeyword+=- shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufNewFile,BufRead *.fish set syntax=sh
autocmd BufNewFile,BufRead *.zcml set syntax=xml
autocmd BufNewFile,BufRead *.jinja,*.j2 set syntax=htmljinja
autocmd BufNewFile,BufRead *.mako set filetype=mako
autocmd BufNewFile,BufRead *.miv1 set filetype=json

autocmd BufNewFile,BufRead emperor.yml set filetype=yaml.ansible

autocmd FileType json syntax match Comment +\/\/.\+$+


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => All Filetypes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

fun! LoadDict()
    let path=expand('~/.vim/dictionaries/' . expand('%:e') . '.txt')
    if filereadable(path)
        exe 'setlocal dictionary+=' . path
    endif
endfun

au BufNewFile,BufRead * call LoadDict()
