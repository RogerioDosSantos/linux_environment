" Extensions not defined on Vim
"

if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.CPP         setfiletype cpp
  au! BufRead,BufNewFile *.H         setfiletype cpp
augroup END

