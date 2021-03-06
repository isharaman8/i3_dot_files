"au CaolorScheme * hi Normal ctermbg=none guibg=none
"au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red
call plug#begin("~/.vim/plugged")
" Theme
"Plug 'navarasu/onedark.nvim'
Plug 'maxmellon/vim-jsx-pretty'
"Plug 'tpope/vim-commentary'
"Plug 'mxw/vim-jsx'
"Plug 'suy/vim-context-commentstring'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'EdenEast/nightfox.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/efm-langserver'
Plug 'mhartington/formatter.nvim'
"Plug 'sbdchd/neoformat'
" Language Client
Plug 'neoclide/coc.nvim', {'branch': 'release'}
""Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-surround'
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
" TypeScript Highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'


" File Explorer with Icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" File Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

"autocmd ColorScheme * hi Normal guibg=NONE ctermbg=NONE

" Enable theming support
if (has("termguicolors"))
   set termguicolors
endif

" Theme
colorscheme duskfox
syntax enable
" hi Normal guibg=NONE ctermbg=NONE
set number
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autocmd BufWritePre *.js Neoformat
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
         \ 'ctrl-t': 'tab split',
         \ 'ctrl-s': 'split',
         \ 'ctrl-v': 'vsplit'
         \}
" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
   split term://fish
   resize 10
endfunction



nnoremap <c-n> :call OpenTerminal()<CR>

"true color
"if exists("&termguicolors") && exists("&winblend")
"  syntax enable
"  set termguicolors
"  set winblend=0
"  set wildoptions=pum
"  set pumblend=5
"  set background=dark
"Use NeoSolarized
"  let g:neosolarized_termtrans=1
"  runtime ./colors/NeoSolarized.vim
"  colorscheme NeoSolarized
"endif

"Background testing"
"if (has("gui_running") || g:neosolarized_termtrans == 0)
"   let s:gui_back        = s:gui_base03
"   let s:term_back        = s:term_base03
"else
"    let s:gui_back        = "NONE"
"    let s:term_back        = "NONE"
"endif


"}}}

"Toggle Transparency
"let t:is_transparent = 0                     
"function! Toggle_transparent_background()                      
"  if t:is_transparent == 0                   
"    hi Normal guibg=#21285e ctermbg=NONE
"    let t:is_transparent = 1
"else
"hi Normal guibg=NONE ctermbg=NONE                    
"    let t:is_transparent = 0                        
"  endif                    
"endfunction               
"nnoremap <C-x><C-t> :call Toggle_transparent_background()<CR>

"File Type Intendation
filetype indent on
set shiftwidth=2
"set ai
"set si
"! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
autocmd BufWritePost * execute "normal gg=G''"
"autocmd BufWritePost * lua vim.lsp.buf.formatting_sync()
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
set ts=3 sw=3 et

"autocmd BufWritePre * undojoin | Neoformat

