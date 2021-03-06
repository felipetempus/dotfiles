" THIS IS A SYMLINK FROM ~/dotfiles/
" IF YOU DESIRE THE OLD .vimrc look into the .original_dotfiles
" Felipe M. - .vimrc

let neovim = has('nvim')

""" Auto install vim-plug -------------------------------------------
let data_dir = neovim ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

""" Geral -----------------------------------------------------------
set number " show line number
set mouse=a " allows mouse to be used
set autoindent " new lines inherit the identetions of previous line
set copyindent
set hlsearch

set cursorline
set hidden
set shiftwidth=4 " number of spaces to use for autoindenting
set splitright
set clipboard=unnamed
syntax enable

let mapleader = ","
let maplocalleader = "\\"

" disable annoying beep
set noerrorbells
set vb t_vb=

" status line
set stl=%f\ %m\ %r\ line\ %l\ of\ %L\ [%p%%],\ column\ %c%=Type:%y
set laststatus=2

" " set shell
" if has('unix')
"   let shell='bash'
" endif

" autocomplete
set complete+=kspell
set shortmess+=c
set completeopt=menuone,longest,preview

"" Maps ++++++++++++++++++
" general
noremap ; :
inoremap jk <Esc>
inoremap JK <Esc>
nmap <C-s> :w<cr>
nmap <F9> :w<cr>:!pipenv run python3 %<cr>

vmap <C-y> <cmd>'<,'>*y<cr>

" move
nnoremap J <C-f>
nnoremap K <C-b>
vnoremap J <C-f>
vnoremap K <C-b>

" buffer/tab control
nmap <Tab><Tab> <esc><C-w><C-w>
nmap <Tab>l <Esc>:bn<cr>
nmap <Tab>h <Esc>:bp<cr>
nmap <Tab>d <Esc>:bdelete<cr>
nmap <Tab>v <Esc>:vert<space>sbNext<cr>


" disables arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

""" Plugins ---------------------------------------------------------
call plug#begin()
	Plug 'preservim/nerdtree'
	Plug 'vim-airline/vim-airline'
	Plug 'morhetz/gruvbox'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-commentary'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'christoomey/vim-tmux-navigator'
	if neovim
	    Plug 'neoclide/coc.nvim', {'branch': 'release'}
	    Plug 'neovim/nvim-lspconfig'
	    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	    Plug 'nvim-lua/plenary.nvim'
	    Plug 'nvim-telescope/telescope.nvim'
	    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	    Plug 'nvim-telescope/telescope-file-browser.nvim'
	    Plug 'kyazdani42/nvim-web-devicons'
	endif
call plug#end()

" Theme Options ------------------------------------------------------
syntax on
set t_Co=256
set cursorline
colorscheme gruvbox
let g:airline_theme='gruvbox'

"" Plugins options ---------------------------------------------------

" NERDtree Options ++++++++++
map <F2> :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>
map <C-d> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1


" COC +++++++++++++++++++++++
" Language servers for COC
let g:coc_global_extensions = [
  \ 'coc-phpls',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-sh',
  \ 'coc-json',
  \ 'coc-yaml',
  \ ]

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OrganizeImport` command for organize imports of the current buffer.
command! -nargs=0 OrganizeImport   :call     CocActionAsync('runCommand', 'editor.action.organizeImport') gr <Plug>(coc-references)


" Telescope Maps ++++++++++++
nnoremap <leader>o <cmd>Telescope oldfiles<cr>
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope builtin<cr>
nnoremap <leader>r <cmd>Telescope registers<cr>
nnoremap <leader>l <cmd>Telescope live_grep<cr>
nnoremap <leader>i <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>p <cmd>Telescope builtin<cr>
nnoremap <leader>j <cmd>Telescope jumplist<cr>
nnoremap <leader>d <cmd>Telescope file_browser<cr>
nnoremap <leader>s <cmd>Telescope git_status<cr>


" Vim Airline options +++++++
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''


" Vim Tmux Navegator Options++
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

