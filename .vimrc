"""""""""""""""""""
"""""""""""""" JP VIMRC
"""""""""""""""""""

set nocompatible
set exrc

" Autocompletion libraries
" let local_python_completion = 'jedi' " 'jedi' or ''

" Plugins {

" Start vim-plug
if !has('nvim')
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd vimrc VimEnter * PlugInstall | source $MYVIMRC
    endif
endif
if has('nvim')
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
            \ https:raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
endif

call plug#begin('~/.vim/plugged')

" Languages
Plug 'sheerun/vim-polyglot'

Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
Plug '1995eaton/vim-better-javascript-completion', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }

Plug 'jmcantrell/vim-virtualenv'
Plug 'hynek/vim-python-pep8-indent'
Plug 'heavenshell/vim-pydocstring'
Plug 'jpalardy/vim-slime'

Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'kannokanno/previm', { 'for': 'markdown' }
Plug 'ap/vim-css-color', { 'for': ['css', 'scss'] }
Plug 'mhinz/vim-hugefile'

" Pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'
Plug 'itspriddle/vim-marked'

" TPope
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
" Plug 'tpope/vim-obsession' | Plug 'dhruvasagar/vim-prosession'

" Appearance
" Plug 'sjl/badwolf'
" Plug 'junegunn/seoul256.vim'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim/' }
Plug 'reedes/vim-colors-pencil'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'reedes/vim-pencil', { 'on': ['Pencil', 'TogglePencil'] }
Plug 'airblade/vim-gitgutter'

Plug 'wincent/terminus'
Plug 'vim-airline/vim-airline-themes' | Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'

" Editing
Plug 'editorconfig/editorconfig-vim'
Plug 'qpkorr/vim-bufkill'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'cohama/lexima.vim'
Plug 'Yggdroot/indentLine'
" Plug 'ntpeters/vim-better-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'justinmk/vim-sneak'
Plug 'mbbill/undotree'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'vim-scripts/neat.vim'
Plug 'Konfekt/FastFold'
Plug 'Konfekt/FoldText'
Plug 'Shougo/neopairs.vim'
Plug 'justinmk/vim-gtfo'

" Search
Plug 'junegunn/vim-fnr' | Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-slash'
Plug 'dyng/ctrlsf.vim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'beloglazov/vim-online-thesaurus'

Plug 'vim-scripts/gitignore'
Plug 'rizzatti/dash.vim', { 'on': 'Dash' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" Plug 'maralla/completor.vim', { 'do': 'cd pythonx/completers/javascript && npm install' } | Plug 'lambdalisue/vim-pyenv'
Plug 'w0rp/ale'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'zchee/deoplete-zsh'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': 'javascript' }
Plug 'lambdalisue/vim-pyenv', { 'for': 'Python' } | Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'Shougo/neco-syntax'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

filetype plugin indent on

" Initial Configuration {

let mapleader = ','

" Disable unnecessary plugins
let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_tutor_mode_plugin = 1
" let g:loaded_netrw             = 1
" let g:loaded_netrwPlugin       = 1
" let g:loaded_netrwSettings     = 1
" let g:loaded_netrwFileHandlers = 1
" let g:loaded_LogiPat           = 1
" let g:loaded_logipat           = 1

" Startify specific
set viminfo='100,n$HOME/.vim/files/info/viminfo

" NVIM Specific
if !has('nvim')
    set nocompatible

    let vimDir = '$HOME/.vim'
    let &runtimepath.=','.vimDir

    syntax on                      " Syntax highlighting
    set autoindent                 " Indent at the same level of the previous line
    set autoread                   " Automatically read a file changed outside of vim
    set backspace=indent,eol,start " Backspace for dummies
    set complete-=i                " Exclude files completion
    set display=lastline           " Show as much as possible of the last line
    set encoding=utf-8             " Set default encoding
    set history=10000              " Maximum history record
    set hlsearch                   " Highlight search terms
    set incsearch                  " Find as you type search
    set laststatus=2               " Always show status line
    set smarttab                   " Smart tab
    set ttyfast                    " Faster redrawing
    set viminfo+=!                 " Viminfo include !
    set wildmenu                   " Show list instead of just completing
    set nrformats-=octal

    set mouse=a mousehide ttyscroll=3
    if has('mouse_sgr')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
elseif has('nvim')
    let vimDir = '$HOME/.config/nvim'
    let &runtimepath.=','.vimDir

    " let g:python_host_prog = '/usr/local/opt/python@2/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'

    if $TERM_PROGRAM =~ 'iTerm'
        set termguicolors
    endif
elseif has('gui_vimr')
    let vimDir = '$HOME/.config/nvim'
    let &runtimepath.=','.vimDir

    " let g:python_host_prog = '/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'

    set termguicolors title
endif
let g:python_host_prog = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/local/bin/python3'

if $TERM_PROGRAM =~# 'iTerm'
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

" GVIM Specific
if has("gui_running")
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions-=T
    set guioptions-=e

    set lines=999 columns=999
    set background=dark linespace=1

    if has("gui_macvim")
        set antialias imd
        set guifont=SourceCodePro:h12
        let macvim_skip_colorscheme = 1
        set fuopt=maxvert,maxhorz
        set transparency=2
        set nolazyredraw
    endif
endif

" Basic
set ignorecase smartcase incsearch hlsearch magic wrapscan
set modeline splitright splitbelow
set scrolloff=3
set autowrite
set mousehide
set hidden
set t_Co=256
set matchtime=5
set report=0
set linespace=0
set conceallevel=0

" Indent
set expandtab smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set nowrap
set whichwrap=b,s,h,l,<,>,[,]

" Files
set termencoding=utf-8 fileencoding=utf-8 ffs=unix,dos,mac
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

" Wild
set wildmenu
set wildmode=list:longest,full

set wildignore+=*DS_Store*
set wildignore+=*/tmp/*,*.o,*.obj,*.so
set wildignore+=*\\tmp\\*,*.exe

set wildignore+=*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip
set wildignore+=*.o,*.out,*.obj,*.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.png,*.jpg,*.gif,*.tiff
set wildignore+=*/tmp/*,*.so,*.swp,*.pdf,*.dmg,*~,._*
set wildignore+=*/.nx/**,*.app
set wildignore+=*.aux,*.toc
set wildignore+=*.pyc,*/__pycache__/*
set wildignore+=node_modules/*,bower_components/*,lib/git/*,assets/*

" Appearance
set colorcolumn=80,100 background=dark number numberwidth=2 display=lastline scrolloff=8
set nocursorline nocursorcolumn norelativenumber nostartofline
set noerrorbells novisualbell
set showcmd showmode showmatch laststatus=2
set fillchars=vert:\ ,stl:\ ,stlnc:\

let g:seoul256_background = 233
let g:gruvbox_contrast_dark = 'hard'
let g:badwolf_darkgutter = 1
let g:badwolf_tabline = 0
colorscheme Tomorrow-Night

" Goyo theme reload
function! s:patch_theme_goyo()
    set background=dark t_Co=256
    let g:seoul256_background = 233
    let g:gruvbox_contrast_dark = 'hard'
    let g:badwolf_darkgutter = 1
    let g:badwolf_tabline = 0
    colorscheme base16-tomorrow-night
    if has("gui_running")
        set transparency=2
    endif
endfunction

" Editing
if has('unnamedplus')
    set clipboard=unnamedplus,unnamed
else
    set clipboard+=unnamed
endif

" Undo
if has('persistent_undo')
    call system('mkdir ' . vimDir)
    let myUndoDir = expand(vimDir . '/undodir')
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" Session
set noswapfile nobackup nowritebackup
set sessionoptions-=winsize,help,options
" Goto last edit on buffer open
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Folds
set foldenable foldmarker={,} foldlevel=0 foldmethod=marker
set foldlevelstart=99 foldnestmax=20
set virtualedit=block
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

" Performance
set updatetime=300 timeout timeoutlen=500 ttimeout ttimeoutlen=50 ttyfast
set completeopt-=preview lazyredraw
set completeopt+=noinsert
" set synmaxcol=128

"Misc
" qq to start recording. Q to play back.
nnoremap Q @q

" Autocommands
augroup vimrc
    autocmd!
augroup END

autocmd vimrc ColorScheme base-16-tomorrow-night call s:patch_theme_goyo()
autocmd vimrc filetype qf setlocal nolist nocursorline nowrap textwidth=0
autocmd vimrc BufRead,BufNewFile *.conf setf dosini
autocmd vimrc filetype * setlocal conceallevel=0
" autocmd BufEnter * EnableStripWhitespaceOnSave
" autocmd vimrc filetype json setlocal foldenable foldlevel=1 foldlevelstart=1 foldmethod=syntax

set timeoutlen=1000 ttimeoutlen=10
imap <C-@> <C-Space>


" Plugin Configuration {
" Languages
let g:javascript_plugin_jsdoc = 1
let g:used_javascript_libs = 'underscore, angularjs, angularui, angularuirouter'
let g:vim_json_syntax_conceal = 0

let g:slime_target = 'tmux'
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}

" let python_version_2 = 1
let python_highlight_all = 1

if $MACHINE == 'production'
    let g:virtualenv_auto_activate=1
elseif $MACHINE == 'local'
    let g:virtualenv_loaded=0
endif

" Appearance
let g:TerminusFocusReporting=1
let g:TerminusNormalCursorShape=2
let g:TerminusReplaceCursorShape=0

let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_faster = 1
let g:indentLine_fileType_exclude = ['text', 'sh', 'markdown', 'tex']
let g:indentLine_buffName_exclude = ['_.*', 'NERD_tree.*']

let g:NERDTreefouseMode = 3
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 25
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeRespectWildIgnore = 0
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeIgnore = [
            \ 'DS_Store',
            \ '\~$', '\._$',
            \ '\.pyc$', '__pycache__$[[dir]]'
            \ ]

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#default#layout = [
            \ [ 'a', 'b', 'c' ],
            \ [ 'z', 'error', 'warning' ]
            \ ]
let g:airline_theme='raven'
let g:airline_detect_spell=0
let g:airline_exclude_preview=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#branch#format=2
let g:airline#extensions#syntastic#enabled=1

" Editing
if $MACHINE == 'production'
    let g:EditorConfig_exec_path = '/usr/bin/editorconfig'
else
    let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
endif
" let g:EditorConfig_core_mode = 'external_command'
let g:EditorConfig_exclude_patterns = [
            \ 'fugitive://.*',
            \ ]

let g:lexima_enable_newline_rules=0

let g:sneak#streak = 1
let g:sneak#use_ic_scs = 1

" let g:better_whitespace_enabled = 0

" Search
nmap gr <plug>(GrepperOperator)
xmap gr <plug>(GrepperOperator)

let g:incsearch#auto_nohlsearch = 1

let g:ctrlsf_case_sensitive = 'yes'
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_ignore_dir = ['bower_components', 'node_modules', 'git', 'assets', 'dist', 'lib']

" File preview using Highlight
let g:fzf_files_options =
            \ '--preview "(highlight -0 ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

let g:fzf_buffers_jump = 0
let g:fzf_layout = { 'down': '~40%' }

nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> bb :Buffers<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG :Ag <C-R><C-A><CR>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Misc
let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = 'tt'

let g:pencil#wrapModeDefault = 'soft'
let g:pencil_neutral_headings = 0
let g:vim_markdown_folding_disabled = 1

autocmd vimrc BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

if $MACHINE == 'local'
    let g:previm_open_cmd = 'open -a Safari'
endif
let g:plug_timeout = 1500

" Startify
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_session_sort = 1
let g:startify_files_number = 8
let g:startify_padding_left = 3
let g:startify_relative_path = 1
let g:startify_session_before_save = [ 'silent! NERDTreeTabsClose' ]
let g:startify_custom_header = [ $MACHINE ]

" Linting
let g:ale_linters = {'python': ['flake8',]}
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '>'
nnoremap <silent> lp <Plug>(ale_previous_wrap)
nnoremap <silent> ln <Plug>(ale_next_wrap)
nnoremap ll <Plug>(ale_detail)

" Thesaurus
let g:online_thesaurus_map_keys = 0
nnoremap <silent> <Leader>t :OnlineThesaurusCurrentWord<CR>

" undoTree
let g:undotree_SetFocusWhenToggle = 1

nnoremap <silent> zr zr:<c-u>setlocal foldlevel?<CR>
nnoremap <silent> zm zm:<c-u>setlocal foldlevel?<CR>

nnoremap <silent> zR zR:<c-u>setlocal foldlevel?<CR>
nnoremap <silent> zM zM:<c-u>setlocal foldlevel?<CR>

" GTFO
" Go to file dir in finder: gof
" Go to file dir in terminal: got

" Change Option Folds
nnoremap zi  :<c-u>call <SID>ToggleFoldcolumn(1)<CR>
nnoremap coz :<c-u>call <SID>ToggleFoldcolumn(0)<CR>
nmap     cof coz

function! s:ToggleFoldcolumn(fold)
  if &foldcolumn
    let w:foldcolumn = &foldcolumn
    silent setlocal foldcolumn=0
    if a:fold | silent setlocal nofoldenable | endif
  else
      if exists('w:foldcolumn') && (w:foldcolumn!=0)
        silent let &l:foldcolumn=w:foldcolumn
      else
        silent setlocal foldcolumn=4
      endif
      if a:fold | silent setlocal foldenable | endif
  endif
  setlocal foldcolumn?
endfunction

" Editing {
" Isort
command! -range=% Isort :<line1>,<line2>! isort -
" select all
nmap <Leader>aa ggVG<CR>
" redo
nnoremap U <C-r>
nnoremap <Leader>u :UndotreeToggle<CR>
" movement
nnoremap j gj
nnoremap k gk

" Basic
inoremap jj <Esc>
cnoremap jj <C-c>
vnoremap v <Esc>
nnoremap ; :
nnoremap <CR> :

" Buffers & Splits
" Unload buffer - keep split
nnoremap bu :BUN<CR>
" Delete buffer - keep split
nnoremap bd :BD<CR>
" Wipe buffer - keep split
nnoremap bw :BW<CR>
" Go to alternate buffer
nnoremap ba :BA<CR>
" Move forwards through buffers
nnoremap bn :BF<CR>
" Split window vertically
nnoremap <Leader>vv <C-w>v
" Split window horizontally
nnoremap <Leader>hh <C-w>s

" Multiple cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Yank
nnoremap <Leader>x "_d
nnoremap <Leader>X "_D
vnoremap <Leader>x "_d
vnoremap <Leader>X "_D

let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Appearance {
" Performance
set fillchars=diff:·

" IndentLines
nmap <silent> <C-l> >>
nmap <silent> <C-k> <<
vmap <silent> <C-l> >gv
vmap <silent> <C-k> <gv
" Parentheses
" let loaded_matchparen = 1
let g:matchparen_timeout = 10
let g:matchparen_insert_timeout = 10
hi MatchParen cterm=NONE ctermbg=NONE ctermfg=DarkYellow
hi MatchParen guibg=NONE guifg=DarkYellow
" Previm
nnoremap <Leader>m :PrevimOpen<CR>
map <Leader>M :w<cr>:silent! !open -a MacDown % > /dev/null &<cr>:redraw!<cr>
" Goyo
nnoremap <F11> :Goyo<CR>
nnoremap <F11> :Goyo<CR>

" Search {
" CtrlSF
nmap <C-F>f <Plug>CtrlSFPrompt
vmap <C-F>f <Plug>CtrlSFCwordPath
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" Navigation {
" Fugitive
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gd :Gdiff<CR>
" NERDTree
nnoremap <silent> <F1> :NERDTreeToggle<CR>
nnoremap <silent> <F2> :NERDTreeFind<CR>

" RangerChooser <Leader> r
function! RangeChooser()
    let temp = tempname()
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <silent> <F12> :<C-U>RangerChooser<CR>

" Allow local vimrc files
set secure

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Completion

let g:acp_enableAtStartup = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_prefetch = 1
let g:deoplete#max_abbr_width = 35
let g:deoplete#max_menu_width = 20

let g:deoplete#sources#buffer#cache_limit_size = 500000
let g:deoplete#file#enable_buffer_path = 1

let g:deoplete#skip_auto_completion_time = '1.0'

let g:necosyntax#min_keyword_length = 3

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

let g:deoplete#sources = {}

function! s:deo_cr() abort
    return deoplete#close_popup() . '<CR>'
endfunction
let g:deoplete#sources#ternjs#timeout = 3
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1

let g:deoplete#sources = get(g:, 'deoplete#sources', {})
let g:deoplete#sources._ = ['buffer', 'member', 'file', 'omni']
let g:deoplete#sources.javascript = ['buffer', 'member', 'file', 'ternjs']
let g:deoplete#sources.jsx = ['buffer', 'member', 'file', 'ternjs']
let g:deoplete#sources.python = [ 'buffer', 'member', 'file', 'jedi']

let g:deoplete#sources#jedi#statement_length = 30
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#short_types = 1

let g:deoplete#sources#ternjs#filetypes = [
	\ 'jsx',
	\ 'javascript.jsx',
	\ 'vue',
	\ 'javascript'
	\ ]

let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
let g:deoplete#ignore_sources.go = ['vim-go']

let g:deoplete#omni#functions = get(g:, 'deoplete#omni#functions', {})
let g:deoplete#omni#functions.css = 'csscomplete#CompleteCSS'
let g:deoplete#omni#functions.html = 'htmlcomplete#CompleteTags'
let g:deoplete#omni#functions.markdown = 'htmlcomplete#CompleteTags'
let g:deoplete#omni#functions.javascript = [ 'tern#Complete', 'jspc#omni', 'javascriptcomplete#CompleteJS' ]

let g:deoplete#omni_patterns = get(g:, 'deoplete#omni_patterns', {})
let g:deoplete#omni_patterns.html = '<[^>]*'
let g:deoplete#omni_patterns.javascript = '[^. *\t]\.\w*'

let g:deoplete#omni#input_patterns = get(g:, 'deoplete#omni#input_patterns', {})
let g:deoplete#omni#input_patterns.xml = '<[^>]*'
let g:deoplete#omni#input_patterns.md = '<[^>]*'
let g:deoplete#omni#input_patterns.css  = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni#input_patterns.scss = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni#input_patterns.sass = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni#input_patterns.python = ''
let g:deoplete#omni#input_patterns.javascript = ''

" Ranking and Marks " {{{
" Default rank is 100, higher is better.
call deoplete#custom#source('omni',          'mark', '⌾')
call deoplete#custom#source('flow',          'mark', '⌁')
call deoplete#custom#source('TernJS',        'mark', '⌁')
call deoplete#custom#source('jedi',          'mark', '⌁')
call deoplete#custom#source('vim',           'mark', '⌁')
call deoplete#custom#source('tag',           'mark', '⌦')
call deoplete#custom#source('around',        'mark', '↻')
call deoplete#custom#source('buffer',        'mark', 'ℬ')
call deoplete#custom#source('syntax',        'mark', '♯')
call deoplete#custom#source('member',        'mark', '.')

call deoplete#custom#source('vim',           'rank', 650)
call deoplete#custom#source('jedi',          'rank', 640)
call deoplete#custom#source('flow',          'rank', 630)
call deoplete#custom#source('TernJS',        'rank', 620)
call deoplete#custom#source('omni',          'rank', 600)
call deoplete#custom#source('member',        'rank', 500)
call deoplete#custom#source('file_include',  'rank', 420)
call deoplete#custom#source('file',          'rank', 410)
call deoplete#custom#source('tag',           'rank', 400)
call deoplete#custom#source('around',        'rank', 330)
call deoplete#custom#source('buffer',        'rank', 320)
call deoplete#custom#source('dictionary',    'rank', 310)
call deoplete#custom#source('syntax',        'rank', 200)

call deoplete#custom#source('_', 'converters', [
	\ 'converter_remove_paren',
	\ 'converter_remove_overlap',
	\ 'converter_truncate_abbr',
	\ 'converter_truncate_menu',
	\ 'converter_auto_delimiter',
	\ ])

autocmd vimrc CompleteDone * silent! pclose!

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "<Down>" : "<C-j>"
imap <expr><C-k>   pumvisible() ? "<Up>" : "<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "<PageDown>" : "<Right>"
inoremap <expr><C-b> pumvisible() ? "<PageUp>" : "<Left>"
imap     <expr><C-d> pumvisible() ? "<PageDown>" : "<C-d>"
imap     <expr><C-u> pumvisible() ? "<PageUp>" : "<C-u>"

" Redraw candidates
inoremap <expr><C-g> deoplete#refresh()
inoremap <expr><C-l> deoplete#complete_common_string()

" <CR>: If popup menu visible, expand snippet or close popup with selection,
"       Otherwise, check if within empty pair and use delimitMate.
inoremap <silent><expr><CR> pumvisible() ?
	\ (neosnippet#expandable() ? neosnippet#mappings#expand_impl() : deoplete#close_popup())
		\ : (delimitMate#WithinEmptyPair() ? "\<C-R>=delimitMate#ExpandReturn()\<CR>" : "\<CR>")

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><Tab> pumvisible() ? "<Down>"
	\ : (<SID>is_whitespace() ? "<Tab>"
	\ : deoplete#manual_complete())

smap <silent><expr><Tab> pumvisible() ? "<Down>"
	\ : (<SID>is_whitespace() ? "<Tab>"
	\ : deoplete#manual_complete())

inoremap <expr><S-Tab>  pumvisible() ? "<Up>" : "<C-h>"

function! s:is_whitespace() "{{{
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction "}}}
" }}}

inoremap <silent> <CR> <C-r>=<SID>deo_cr()<CR>
inoremap <expr><TAB> pumvisible() ? '<C-n>' : '<TAB>'
inoremap <expr><C-h> deoplete#smart_close_popup().'<C-h>'
inoremap <expr><BS> deoplete#smart_close_popup().'<C-h>'

inoremap <expr><Down> pumvisible() ? '<C-n>' : '<Down>'
inoremap <expr><Up> pumvisible() ? '<C-p>' : '<Up>'
inoremap <silent><expr><C-Space> deoplete#manual_complete()

function g:Multiple_cursors_before()
    let g:deoplete#disable_auto_complete = 1
endfunction
function g:Multiple_cursors_after()
    let g:deoplete#disable_auto_complete = 0
endfunction
