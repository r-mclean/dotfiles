if (has("termguicolors"))
    set termguicolors
endif

" Plugins
call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'chrisbra/csv.vim'
    Plug 'junegunn/fzf.vim'
    Plug 'simnalamburt/vim-mundo'

    " the mighty Conquer of Completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " git plugin
    Plug 'tpope/vim-fugitive'

    " status line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " surrounding
    Plug 'machakann/vim-sandwich'

    " grubox theme
    "Plug 'morhetz/gruvbox'
    Plug 'Luxed/ayu-vim'

    " emmet for htnl development
    Plug 'mattn/emmet-vim'
    
    " rails development
    "Plug 'tpope/vim-rails'
    
    " tmux navigation
    Plug 'christoomey/vim-tmux-navigator'
call plug#end()

set clipboard+=unnamedplus

" no swap file
set noswapfile

" save undo-trees in files
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000

set number

" use 4 spaces instead of tabs ()
" copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" show substitution
set inccommand=nosplit

nnoremap <space> <nop>
let mapleader = "\<space>"

nnoremap <leader>bn :bn<cr> ;buffer next
nnoremap <leader>tn gt ;new tab

" Config for fzf.vim
if has('mac')
    set rtp+=~/dotfiles/zsh/external/fzf
endif
nnoremap <leader>f :Files<cr>

" config for gruvbox
"let g:gruvbox_italic=1
"let g:gruvbox_underline=1
"let g:gruvbox_contrast_dark='hard'
"autocmd vimenter * ++nested set background=dark
"autocmd vimenter * ++nested colorscheme gruvbox

" config for vim-ayu
set background=dark
let g:ayucolor="dark"
colorscheme ayu

" config for vim-airline
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#enabled=1

" config for Emmet
let g:user_emmet_leader_key=','
let g:user_emmet_install_global=0
autocmd FileType html,css,vue EmmetInstall

" config for coc.nvim
" Textedit might fail is hidden is not set
set hidden

" some servers have issues if backup is set
set nobackup
set nowritebackup

" give more space for writing messages
set cmdheight=2

" Havinglonger updatetime (default is 4000ms) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" don't pass messages to |ins-completion-menu|
set shortmess+=c

" use <c-space> to trigger completion
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" make <CR> auto-select the first completion item and notify coc.nvim
" to format on enter, <cr> could be remapped by other vim plugins
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" use 'g[' and ']g' to navigate diagnostics
" use ':CocDiagnostics' to get all diagnostics of current buffer
nmap <silent> [g <Plug>(coc-diagnostics-prev)
nmap <silent> g[ <Plug>(coc-diagnostics-next)

" goto code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>coc-implementation)
nmap <silent> gr <Plug>coc-references)

" use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" config for chrisbra/csv.vim
augroup filetype_csv
    autocmd!

    autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
    autocmd BufWritePre *.csv :%UnArrangeColumn
    inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm()
        \: "\<C-g>u\<Tab>\<c-r>=coc#on_enter()\<CR>"
augroup END

