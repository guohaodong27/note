# normal模式自动切换输入法

**将以下代码插入.vimrc中**
```text
"以下是切换输入法
let g:input_toggle = 1
function! Fcitx2en()
let s:input_status = system("fcitx-remote")
if s:input_status == 2
  let g:input_toggle = 1
  let l:a = system("fcitx-remote -c")
endif
endfunction

function! Fcitx2zh()
let s:input_status = system("fcitx-remote")
if s:input_status != 2 && g:input_toggle == 1
  let l:a = system("fcitx-remote -o")
  let g:input_toggle = 0
endif
endfunction

set timeoutlen=150
autocmd InsertLeave * call Fcitx2en()
"autocmd InsertEnter * call Fcitx2zh()
```

> 取消最后一行的注释可以切换回插入模式时进入中文输入法


