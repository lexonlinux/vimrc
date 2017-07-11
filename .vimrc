set autochdir
set tags=tags;
"high light the searching word
let &titlestring = expand("%:p")
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif
set hlsearch


let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
inoremap jk <ESC>
let Tlist_Auto_Open=0

"update ctags when press F10 
function! UpdateCtags()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if filewritable("./tags")
        !ctags -R --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q
        TlistUpdate
    endif
    execute ":cd " . curdir
endfunction
nmap <F10> :call UpdateCtags()<CR>
"switch windows in vim
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapWindowNavArrows = 1
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l
"map <Leader>mbe :MBEOpen<cr>
"map <Leader>mbc :MBEClose<cr>
"map <Leader>mbt :MBEToggle<cr>


"cscope add
if has("cscope")  
   " set csprg=/usr/bin/cscope  
    set csto=0  
    set cst  
    set csverb  
    set cspc=3  
    "add any database in current dir  
    if filereadable("cscope.out")  
        cs add cscope.out  
    "else search cscope.out elsewhere  
    else  
       let cscope_file=findfile("cscope.out", ".;")  
       let cscope_pre=matchstr(cscope_file, ".*/")  
       if !empty(cscope_file) && filereadable(cscope_file)  
           exe "cs add" cscope_file cscope_pre  
       endif        
     endif  
endif 



nmap fs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap fg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap fc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap ft :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap fe :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap fn :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap fi :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap fd :cs find d <C-R>=expand("<cword>")<CR><CR>



 
 
nmap fc :cs find c <C-R>=expand("<cword>")<CR><CR>

"set tags=~/workspace/rdadroid-4.4.2_r1-rel5.0.y/modem/modem-dualmode-2g/soft_dev/platform/edrv/pmd/tags
"set nerdtree in the right
let NERDTreeWinPos=1
"add split shortcutkey

nmap    w=  :resize +3<CR>
nmap    w-  :resize -3<CR>
nmap    w,  :vertical resize -3<CR>    
nmap    w.  :vertical resize +3<CR>

"change word to uppercase, I love this very much  
inoremap <C-u> <esc>gUiwea

inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
"inoremap { {<CR>}<ESC>O
inoremap { { }<ESC>i<CR><ESC>V<O

"设置跳出自动补全的括号
func SkipPair()  
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'  
        return "\<ESC>la"  
    else  
        return "\t"  
    endif  
endfunc  
" 将tab键绑定为跳出括号  
inoremap <TAB> <c-r>=SkipPair()<CR>


set autoindent 
set mouse=a

