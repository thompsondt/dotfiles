" Get Envrionemnt Information
let ENV_OS = substitute(system('uname'), "\n", "", "")
if ENV_OS == "Darwin"
    let ENV_OS = "mac"
endif


" ----------------------
" Some setup for pathogen
" ----------------------
execute pathogen#infect()
filetype plugin indent on

" Setting up the Python file conventions
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set textwidth=79

" Set up indentation settings for HTML files
autocmd FileType htmldjango.html setlocal shiftwidth=2 tabstop=2 textwidth=150

" Display tabs, eols, trailing chars, etc as actual characters
set list
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

" Setting up my personal preferences
syntax on                           " Activates Syntax Highlihgting
colorscheme solarized               " Jellybeans and Desert are my favorite schemes
set background=dark                 " Best for the 'solarized' colorscheme
let g:solarized_termcolors=256      " Allow Solarized to use 256 terminal colors

" COLORSCHEME TROUBLESHOOTING:
" Issue: Solarized looks funny: - this may be due to your terminal colors not
" being set to follow the 'solarized' color pallet. To fix this, edit the
" the colors in the terminal preferences to match the colors specified as the
" 'solarized' color pallet. For a reference see:
" ~/.vim/thompson-dotfiles/.vim/bundle/vim-colors-solarized/README.mkd

set cursorline                      " Highlights the line with the cursor
hi CursorLine   cterm=NONE ctermbg=236 ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" A URL for more xterm color codes
" http://upload.wikimedia.org/wikipedia/commons/9/95/Xterm_color_chart.png

" Fix broken BACKSPACE in vim 7.4... hopefully they fix this one day
set backspace=indent,eol,start


    " Remap jk to <ESC> for the sake of efficiency
imap jk <Esc>

set ruler
set number
set autoindent
" set nowrap                          " Stop lines from wrapping
set ignorecase                      " Ignore case when searching
set colorcolumn=100                 " Marks the 100th column


" ----------------------
" NERDTree Plugin
" ----------------------
"
" Next Map F4 to toggle NERDTree
noremap <F4> :NERDTreeToggle<CR>


" ----------------------
" Snipmate Plugin
" ----------------------
filetype plugin on

" Uncomment the next line to force snipmate to load both HTML and HTMLDJANGO
" snippets for any HTML file
au BufNewFile,BufRead *.html set ft=htmldjango.html

" ----------------------
" Taglist Plugin
" ----------------------
"
" Next Toggles taglist with F3 key
noremap <F3> :TlistToggle<CR>

let Tlist_Exit_OnlyWindow = 1       " If quitting vim, quit this too
let Tlist_Use_Right_Window = 1      " Split to the right side of the screen
let Tlist_GainFocus_On_ToggleOpen = 1   " Jump to taglist window on open

" OSX Specific Stuff
if ENV_OS == "mac"
    " If running under OSX we need tell Taglist where to find 'exuberant-ctags'
    " NOTE: This depends on the user installing 'exuberant-ctags' with the
    " command:
    " $brew install ctags-exuberant
    let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
endif
