" == My custom vimscript

let s:nvim = has('nvim')

if !exists('s:profile_loads')
  let s:profile_loads = 0
endif

if s:profile_loads > 1
  echo "reloading profile " . string(s:profile_loads)
endif

if !s:nvim
  set nocompatible " be iMproved
endif

filetype off

" initialize plugins
call plug#begin('~/.vim/bundle')

" === Common plugins

" TODO: THINK: how to provide meta info about each plugin:
"              - git repo
"              - plugin category
"              - keydings
"              - description
"              - init code

" General plugins
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/CursorLineCurrentWindow'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'itchyny/vim-cursorword'

" Searching
Plug 'eugen0329/vim-esearch'
Plug 'romainl/vim-cool'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Tests
Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'

" CTags support
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" Lnaguge server protocol support
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy engine for fast selection menus
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Db interactions
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" Autocompltion
" NOTICE: if you prefer this kind of autocomplete plugins
"         select which one you like:
"
" Plug 'kana/vim-smartinput'
" Plug 'ervandew/supertab'
Plug 'ajh17/VimCompletesMe'

" === Languages

Plug 'jceb/vim-orgmode'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml'
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'slim-template/vim-slim'
Plug 'mitsuhiko/jinja2'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'garyburd/go-explorer'
Plug 'wavded/vim-stylus'
Plug 'stephenway/postcss.vim'

" === Colorschemes
Plug 'ChrisKempson/Tomorrow-Theme', { 'rtp' : 'vim' }
Plug 'danilo-augusto/vim-afterglow'
Plug 'KabbAmine/yowish.vim'
Plug 'sainnhe/sonokai'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'lmintmate/blue-mood-vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'jpo/vim-railscasts-theme'
Plug 'iCyMind/NeoSolarized'
Plug 'nightsense/cosmic_latte'
Plug 'romgrk/github-light.vim'
Plug 'liuchengxu/space-vim-theme'

" Plugins i'm working on:
Plug 'pechorin/any-jump.vim'
" Plug '~/work/any-jump.vim'

call plug#end()

" === External utils

" use rg
if executable('rg')
  set grepprg=rg\ --color=never
else
  echoe "Please install ripgrep"
end

" zsh
if executable('/bin/zsh')
  set shell=/bin/zsh\ -l
end

filetype plugin indent on

" === Vim options

set showmode       " always show what mode we're currently editing in

" set completion options
set complete=.,w,b,u,t,i

" update interval
set updatetime=1000

set encoding=utf-8
set fileencodings=utf-8,cp1251
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

set wildmenu       " display command-line autocomplete variants
set wildmode=full
set wildignore+=.hg,.git,.svn,*.DS_Store,*.pyc

set title          " change the terminal's title

set visualbell     " Use visual bell instead of beeping

set scrolloff=15  " makes vim centered like a iA Writer
set showtabline=1  " display tabline only if where is more then one tab

set linebreak      "

set autoindent     " always set autoindenting on
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set cursorline
set splitbelow
set splitright
set mousehide      " Hide the mouse when typing text
set laststatus=2

set hidden         " this allows to edit several files in the same time without having to save them

if has("linebreak")
  let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
endif

set incsearch      " show search matches as you type
set ignorecase     " ignore case when searching
set smartcase
set showmatch      " set show matching parenthesis
set gdefault       " all matches in a line are substituted instead of one.

" === Don't skip wrap lines
noremap j gj
noremap k gk

set history=1000    " store lots of :cmdline history
set undolevels=1000 " use many muchos levels of undo
set nobackup        " no backup files
set nowritebackup   " only in case you don't want a backup file while editing
set noswapfile      " no swap files
set timeoutlen=500

" === GUI
syntax on

if !has("nvim")
  set guifont=Monaco:h14
endif

set guioptions-=T  " remove gui toolbar
set guioptions-=l  " remove left-hand scrollbar
set guioptions-=L  " remove left-hand scrollbar
" set guioptions+=a  " automatically add selected text in the VISUAL mode to system copy-paste buffer
" set guioptions-=e  " remove gui tabs

" term options
" set termguicolors

" theme options, applied only first script load
if s:profile_loads == 0
  colorscheme palenight
endif

" do not hl cursor in term
hi CursorLine cterm=NONE

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.
let NERDTreeIgnore=['\.git$']


" javascript-libraries-syntax.vim
let g:used_javascript_libs = 'underscore, backbone, angularjs'

" markdown
let g:vim_markdown_folding_disabled=1

" vim-test
if s:nvim
  let test#strategy = "neovim"
  let test#neovim#term_position = "rightbelow 15"
else
  let test#neovim#term_position = "rightbelow"
endif

"  ruby
let ruby_operators        = 1
let ruby_pseudo_operators = 1

" esearch
let g:esearch = { 'adapter': 'rg', 'backend': 'system', 'out': 'qflist' }

" coc.nvim

fu! g:ShowCocDocumentation() abort
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfu

" Use K to show documentation in preview window.
nnoremap <silent> K :call g:ShowCocDocumentation()<CR>

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
" autocmd CursorHold * silent call g:ShowCocDocumentation()

" --- gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:go_doc_popup_window                = 1
let g:go_highlight_extra_types           = 1
let g:go_highlight_operators             = 1
let g:go_highlight_functions             = 1
let g:go_highlight_format_strings        = 1
let g:go_highlight_function_parameters   = 1
let g:go_highlight_function_calls        = 1
let g:go_highlight_types                 = 1
let g:go_highlight_fields                = 1
let g:go_highlight_generate_tags         = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments  = 1

let g:go_mod_fmt_autosave = 1
let g:go_fmt_autosave = 1

" --- org-mode
let g:org_agenda_files = ['~/orgs/*.org']

" --- ruby
let g:ruby_operators        = 1
let g:ruby_pseudo_operators = 1
let g:ruby_no_expensive = 1

" --- any-jump.vim config
let g:any_jump_ignored_files = ['*.tmp', '*.temp']
let g:any_jump_search_prefered_engine = 'rg'

"  fzf configuration
let g:fzf_preview_window = ''

"  with floating windows support
if s:nvim
  " TODO: implement vim support
  set wildoptions=pum
  set pumblend=8
  set inccommand=nosplit

  " set floatblend=8

  " == Floating FZF

  " Reverse the layout to make the FZF list top-down
  " let $FZF_DEFAULT_OPTS='--layout=reverse'

  " Using the custom window creation function
  let g:fzf_layout = { 'window': 'call FloatingFZF()' }

  " Function to create the custom floating window
  function! FloatingFZF()
    " creates a scratch, unlisted, new, empty, unnamed buffer
    " to be used in the floating window
    let buf = nvim_create_buf(v:false, v:true)

    " 90% of the height
    let height = float2nr(&lines * 0.7)
    " 60% of the height
    let width = float2nr(&columns * 0.5)
    " horizontal position (centralized)
    let horizontal = float2nr((&columns - width) / 2)
    " vertical position (one line down of the top)
    let vertical = 2

    let opts = {
          \ 'relative': 'editor',
          \ 'row': vertical,
          \ 'col': horizontal,
          \ 'width': width,
          \ 'height': height
          \ }

    " open the new window, floating, and enter to it
    call nvim_open_win(buf, v:true, opts)
  endfunction
endif

let g:CoolTotalMatches = 1

" --- Lightline settings
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste', 'gutentags', 'method' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'gutentags': "gutentags#statusline",
      \ },
      \ }

" --- Getuntags

augroup MyGutentagsStatusLineRefresher
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END

let g:gutentags_define_advanced_commands = 1
" let g:gutentags_trace = 1

let g:gutentags_ctags_exclude = ['*.js', '*.jsx', '*.coffee', '*.js.erb', 'node_modules']

if executable('rg')
  let g:gutentags_file_list_command = 'rg --files'
end

" --- Custom bindings/mappings/autocommands ---

" TODO: add augroup custom?
" TODO: move to separate file?

" remap ; to :
nmap ; :

" set leader key
let mapleader=","
let maplocalleader= "\\"

" https://github.com/r00k/dotfiles/blob/master/vimrc
" Disable that goddamn 'Entering Ex mode. Type 'visual' to go to Normal mode.'
" that I trigger 40x a day.
map Q <Nop>
" Disable K looking man stuff up
" map K <Nop>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" === haml
au BufNewFile,BufRead *.lmx set filetype=haml

" pretty colymn hi for yaml modes
autocmd FileType yaml setlocal cursorcolumn
autocmd FileType eruby.yaml setlocal cursorcolumn

" js with 2 tabs - is ok
autocmd FileType javascript setl sw=2 sw=2 sts=2

" custom types autocmd mappinngs
autocmd FileType nasm setlocal commentstring=;\ %s

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" auto-remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" config prefered searcher for DimJump
autocmd BufNewFile,BufRead * let b:preferred_searcher = 'rg'

" for alternative Gemfiles
autocmd BufNewFile,BufRead Gemfile_* let &filetype = 'ruby'

" Start terminal in insert mode
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

au BufNewFile,BufRead *.rs     set filetype=rust
au BufNewFile,BufRead *.yml.j2 set filetype=yaml
au BufNewFile,BufRead *.cjsx   set filetype=coffee
au BufNewFile,BufRead *.pcss   set filetype=postcss
au BufNewFile,BufRead *.arb	   set ft=ruby

" reload buffer on change
augroup checktime
    au!
    autocmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
augroup END


" ~ Navigation utilities mappings ~

" Buffers lists
nmap <leader>b :Buffers<CR>

" Tagbar
map <leader>et :Tagbar<CR>

" NERDTree for current working dir
nmap <leader>n :NERDTree<CR>

" NERDTree for current file
nmap <leader>N :NERDTree %<CR>

" ~ Buffer functions mappings ~

" comment current line
nmap <leader>c <Plug>CommentaryLine

" comment block in visual mode
vmap <leader>c <Plug>Commentary

" run tests for current file
nmap <silent> <leader>eT :TestFile<CR>

" new tab
map <leader>T :tabnew<CR>
map <cmd>T :tabnew<CR>

" ~ FZF mappings ~

" current project files
nmap <leader>q :Files<CR>

" helptags
map <leader>sh :Helptags <CR>

" theme switcher
map <leader>st :Color <CR>

" ~ development mappings ~

" eval current vimscrupt buffer
map <leader>ee :so %<CR>

" open $MYVIMRC
map <leader>ev :vsplit ~/.vimrc <CR>

" map ESC for enter to normal mode inside terminal
" tmap <ESC> <C-\><C-n>

" - terminal keys -

" improved keyboard support for navigation (especially terminal)
" https://neovim.io/doc/user/nvim_terminal_emulator.html
" tnoremap <Esc> <C-\><C-n>

nnoremap <silent> <leader>tt :terminal<CR>I
nnoremap <silent> <leader>tv :vnew<CR>:terminal<CR>I
nnoremap <silent> <leader>tn :new<CR>:terminal<CR>I
nnoremap <silent> <leader>ts :new<CR>:terminal<CR> :res 15<CR>I

" --- end profile loading
let s:profile_loads += 1
