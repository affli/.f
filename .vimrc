" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
syntax on

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup


if has("gui_macvim")
	let macvim_hig_shift_movement = 1
	let macvim_skip_cmd_opt_movement = 1
	set go-=T
	set bg=dark
	set guifont=Terminus\ Medium:h18
if &background == "dark"
    hi normal guibg=black
    set transp=9
endif
	colorscheme macvim
endif

"
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smartindent
set autoindent
 
set hlsearch
set incsearch
set showmatch
 
set number
filetype on
filetype plugin on
"
if v:version >= 700
  set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
  let OmniCpp_GlobalScopeSearch   = 1
  let OmniCpp_DisplayMode         = 1
  let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
  let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
  let OmniCpp_ShowAccess          = 1 "show access in pop-up
  let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
  set completeopt=menuone,menu,longest
    let &tags = './tags,tags,' . substitute(expand("%:p:h"), "\(^\/Users\/ya\/.vimrc\/tags/\).*$", "\1", "")
endif

"set dictionary+=~/.vim/wowlua.dict
