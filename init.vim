" My neovim config
"
" Pre-install:
" * fonts + icons: https://github.com/ryanoasis/nerd-fonts
" * fast search: https://github.com/BurntSushi/ripgrep
"   cargo install ripgrep
" * rust completions: https://github.com/phildawes/racer
"   cargo install racer
" * python3 neovim integration:
"   pip3 install neovim
" * ensime for vim:
"   pip2 install --user --upgrade neovim
"   pip2 install --user --upgrade websocket-client sexpdata
"
" see http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" see https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
"

" Bundles (via Shouho/dein.vim) {
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
if (!isdirectory(expand("$HOME/.config/nvim/bundles/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/bundles/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/bundles/repos/github.com/Shougo/dein.vim"))
endif
set runtimepath+=~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('$HOME/.config/nvim/bundles'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')
call dein#add('haya14busa/dein-command.vim')

" Add or remove your plugins here:
"call dein#add('')

" GUI
call dein#add('mhartington/oceanic-next')
call dein#add('ryanoasis/vim-devicons')
call dein#add('bling/vim-airline')
call dein#add('Yggdroot/indentLine')
call dein#add('sheerun/vim-polyglot')

" navigation
call dein#add('scrooloose/nerdtree', {'on_cmd': 'NERDTreeToggle'}) " alternatives: Shougo/vimfiler
call dein#add('Shougo/denite.nvim') " alternatives: unite, ctrlp, ctrlp-funky, commandT, fzf (fuzzyfinder)
"call dein#add('christoomey/vim-sort-motion', {'on_cmd': 'gs'})
call dein#add('wellle/targets.vim')
call dein#add('michaeljsmith/vim-indent-object') " alternatives: kana/vim-textobj-indent

" edition
call dein#add('editorconfig/editorconfig-vim')
call dein#add('Chiel92/vim-autoformat')
call dein#add('tomtom/tcomment_vim') " alternatives: NERDCommenter
call dein#add('Shougo/deoplete.nvim')
call dein#add('Raimondi/delimitMate')

" lang: javascript / typescript
"call dein#add('maksimr/vim-jsbeautify', {'on_ft: ['javascript', 'css']})
"call dein#add('othree/yajs.vim', {'on_ft': 'javascript'})
"call dein#add('othree/jsdoc-syntax.vim', {'on_ft':['javascript', 'typescript']})
"call dein#add('othree/es.next.syntax.vim', {'on_ft': 'javascript'})
"call dein#add('1995eaton/vim-better-javascript-completion', {'on_ft': ['javascript']})
"call dein#add('othree/javascript-libraries-syntax.vim')
"call dein#add('HerringtonDarkholme/yats.vim', {'on_ft': 'typescript'})
"call dein#add('Quramy/tsuquyomi', {'on_ft': 'typescript'})

" lang: rust
call dein#add('rust-lang/rust.vim', {'on_ft': 'rust'})
call dein#add('racer-rust/vim-racer', {'on_ft': 'rust'})

" lang: scala
call dein#add('ensime/ensime-vim')
call dein#add('derekwyatt/vim-scala', {'on_ft': 'scala'})

" lang: misc

"call dein#add('kchmck/vim-coffee-script', {'on_ft': 'coffee'})
"call dein#add('hail2u/vim-css3-syntax', {'on_ft':['css','scss']})
"call dein#add('elzr/vim-json', {'on_ft': 'json'})
"call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})
"call dein#add('suan/vim-instant-markdown', {'on_ft': 'markdown'})
"call dein#add('dhruvasagar/vim-table-mode')
"call dein#add('tmhedberg/SimpylFold', {'on_ft': 'python'})

" analyzer, builder,...
call dein#add('neomake/neomake') " alternatives: syntastic
" git
"call dein#add('tpope/vim-fugitive')
"call dein#add('Xuyuanp/nerdtree-git-plugin', {'on_cmd': 'NERDTreeToggle'})

" tools
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
call dein#add('diepm/vim-rest-console')

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

" }

" Icons {
" see https://github.com/ryanoasis/vim-devicons
" Pre-install : https://github.com/ryanoasis/nerd-fonts

"}

" Denite {
"
" ripgrep
call denite#custom#var('file_rec', 'command', ['rg', '--files'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])

call denite#custom#source('file_mru', 'converters', ['converter_relative_word'])

" }

" OFF: CtrlP {
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.gitignore', '.editorconfig']
" }

" OFF: Syntastic {
" my basic conf
"

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 3

"let g:syntastic_error_symbol = "\u2717"
"let g:syntastic_warning_symbol = "\u26A0"
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
 " }

" NeoMake {

"let g:neomake_enabled_makers = ['makeprg', 'cargo']
let g:neomake_python_enabled_makers = ['pep8', 'pylint']
"let g:neomake_rust_enabled_makers = ['cargo']
let b:neomake_rust_enabled_makers = ['rustc']
let g:neomake_open_list = 2
let g:neomake_serialize = 1

let g:neomake_verbose=3
let g:neomake_logfile='/tmp/neomake.log'
"autocmd! BufWritePost * Neomake!

let g:quickfixsigns_protect_sign_rx = '^neomake_'
" }

" Completion {
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer']
" }

" Colors and fonts {
" For Neovim 0.1.3 and 0.1.4
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

 " Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

syntax enable
colorscheme OceanicNext
" enable italics, disabled by default
let g:oceanic_next_terminal_italic = 1

" enable bold, disabled by default
let g:oceanic_next_terminal_bold = 1

let g:airline_theme='oceanicnext'
set encoding=utf8
"linux:  set guifont=<FONT_NAME> <FONT_SIZE>
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
"mac osx: set guifont=<FONT_NAME>:h<FONT_SIZE>
set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h13
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
" }

" Airline {
"

" status line always opened
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
"  powerline font
let g:airline_powerline_fonts=1
cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
" }

" Disable Arrow and Non Counted move {
" see http://jeetworks.org/vim-making-those-arrow-keys-work-for-you-or-why-the-anti-arrow-key-propoganda-is-wrong/
" inoremap <Up>       <NOP>
" inoremap <Down>     <NOP>
" inoremap <Left>     <NOP>
" inoremap <Right>    <NOP>
noremap <Up>       :echomsg "Use k"<CR>
noremap <Down>     :echomsg "Use j"<CR>
noremap <Left>     :echomsg "Use h"<CR>
noremap <Right>    :echomsg "Use l"<CR>

" see http://jeetworks.org/from-acolyte-to-adept-the-next-step-after-nop-ing-arrow-keys/
" Notes:
"   (1) To enhance the ergonomics of this sufficiently to make it practical, at
"       least, until your brain grows a new lobe dedicated to counting line offsets
"       in the background while you work, you should either make sure you have
"       something like the following in your `~/.vimrc`:
"
          set number
          if has('autocmd')
          augroup vimrc_linenumbering
              autocmd!
              autocmd WinLeave *
                          \ if &number |
                          \   set norelativenumber |
                          \ endif
              autocmd BufWinEnter *
                          \ if &number |
                          \   set relativenumber |
                          \ endif
              autocmd VimEnter *
                          \ if &number |
                          \   set relativenumber |
                          \ endif
          augroup END
          endif
"
"       or you have installed a plugin like
"       (vim-numbers)[https://github.com/myusuf3/numbers.vim].
"
"   (2) You might want to relax the constraint for horizontal motions, or
"       add other motions. You can customize the list of motions by
"       specifying the keys in the
"       `g:keys_to_disable_if_not_preceded_by_count` variable. For example,
"       the following only enforces count-prefixed motions for "j" and "k":
"
"         let g:keys_to_disable_if_not_preceded_by_count = ["j", "k"]

function! DisableIfNonCounted(move) range
    if v:count
        return a:move
    else
        " You can make this do something annoying like:
           " echoerr "Count required!"
           " sleep 2
        return ""
    endif
endfunction

function! SetDisablingOfBasicMotionsIfNonCounted(on)
    let keys_to_disable = get(g:, "keys_to_disable_if_not_preceded_by_count", ["j", "k", "l", "h"])
    if a:on
        for key in keys_to_disable
            execute "noremap <expr> <silent> " . key . " DisableIfNonCounted('" . key . "')"
        endfor
        let g:keys_to_disable_if_not_preceded_by_count = keys_to_disable
        let g:is_non_counted_basic_motions_disabled = 1
    else
        for key in keys_to_disable
            try
                execute "unmap " . key
            catch /E31:/
            endtry
        endfor
        let g:is_non_counted_basic_motions_disabled = 0
    endif
endfunction

function! ToggleDisablingOfBasicMotionsIfNonCounted()
    let is_disabled = get(g:, "is_non_counted_basic_motions_disabled", 0)
    if is_disabled
        call SetDisablingOfBasicMotionsIfNonCounted(0)
    else
        call SetDisablingOfBasicMotionsIfNonCounted(1)
    endif
endfunction

" command! ToggleDisablingOfNonCountedBasicMotions :call ToggleDisablingOfBasicMotionsIfNonCounted()
" command! DisableNonCountedBasicMotions :call SetDisablingOfBasicMotionsIfNonCounted(1)
" command! EnableNonCountedBasicMotions :call SetDisablingOfBasicMotionsIfNonCounted(0)
"
" DisableNonCountedBasicMotions
" }

" EditorConfig {
"
" to avoid issues with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']"
"}

" JsBeautify {
" see https://github.com/maksimr/vim-jsbeautify
" require installation of https://github.com/beautify-web/js-beautify :
" > pip install jsbeautifier
" OR
" > npm -g install js-beautify

" format selection
" autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
" autocmd FileType json vnoremap <buffer>  <c-f> :call RangeJsonBeautify()<cr>
" autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
" autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
"
" format the whole file
" autocmd FileType javascript nnoremap <buffer>  <c-f> :call JsBeautify()<cr>
" autocmd FileType json nnoremap <buffer>  <c-f> :call JsonBeautify()<cr>
" autocmd FileType html nnoremap <buffer> <c-f> :call HtmlBeautify()<cr>
" autocmd FileType css nnoremap <buffer> <c-f> :call CSSBeautify()<cr>
" "}

" Javascript {

let g:used_javascript_libs = 'jquery,underscore,requirejs,chai,handlebars'

" use https://github.com/feross/standard to check and to format on save
"let g:syntastic_javascript_checkers = ['standard']
"autocmd bufwritepost *.js silent !standard % --format

"let g:syntastic_javascript_checkers = ['eslint']

"set autoread
"}

" Typescript {

let g:syntastic_typescript_tsc_fname = ''
"}

" Rust {
" 'cargo install racer'
" In insert mode use C-x-C-o to search for completions
" In normal mode type gd to go to a definition
" In normal mode type gs to splitted open a definition
" In normal mode type gx to vsplitted open a definition
"let g:racer_cmd = expand("$HOME/.cargo/bin/racer")
"let $RUST_SRC_PATH = expand("$HOME/.cargo/registry/src/rustc-1.11.0/src")

let g:ftplugin_rust_source_path = $RUST_SRC_PATH
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1
"}

" Python {

let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_python_flake8_exec = '/usr/local/bin/python3'
let g:syntastic_python_flake8_args = ['-m', 'flake8']
"}

" Scala {
" ensime
autocmd BufWritePost *.scala silent :EnTypeCheck
au FileType scala nnoremap <leader>gd :EnDeclaration<CR>
au FileType scala nnoremap <leader>gs :EnDeclarationSplit<CR>
au FileType scala nnoremap <leader>gx :EnDeclarationSplit v<CR>
au FileType scala nnoremap <F2> :EnDocBrowse<CR>
" neomake
let g:neomake_sbt_maker = {
        \ 'exe': 'sbt',
        \ 'args': ['set skip in update := true', 'offline', '-Dsbt.log.format=false', 'compile', 'test;compile'],
        \ 'errorformat':
        \   '[%trror] %f:%l:\ %m,%-G%.%#'.
        \   '[%tarn] %f:%l: %m',
        \ }
au FileType scala nnoremap <leader>b :Neomake! sbt<CR>
" }

" Markdown {

" no need to fold things in markdown all the time
let g:vim_markdown_folding_disabled = 1
" turn on spelling for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
" highlight bad words in red
autocmd BufRead,BufNewFile *.md hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224
" disable markdown auto-preview. Gets annoying
let g:instant_markdown_autostart = 0

" }

" NERDTree {
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" }

" Git {
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
" }

" Core {
"
"set number "see section Disable Arrow
"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set listchars=tab:>·,trail:␣
set list
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" }

" My Key Mapping
" try to only use Leader
"
let mapleader = "\<Space>"

" No need for ex mode
nnoremap Q <nop>
" recording macros is not my thing
map q <Nop>

" navigation between files
    "nnoremap <Leader>o :CtrlP<CR>
    nnoremap <Leader>o  :Denite buffer file_rec<CR>
    nnoremap <Leader>f  :Denite grep<CR>
    nnoremap <Leader>w  :w<CR>
    map <Leader>e :NERDTreeToggle<CR>

" navigation between window
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" navigation between lines
    noremap H ^
    noremap L g_
    noremap J 5j
    noremap K 5k
    nnoremap <Leader>l  :Denite line<CR>

" navigation panel & tmux
    "let g:tmux_navigator_no_mappings = 1
    " nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
    " nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
    " nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
    " nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
    " nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>
    "
" navigation between buffers
    "nmap <leader>t :term<cr>
    nmap <leader>, :bnext<CR>
    nmap <leader>. :bprevious<CR>
    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
" copy/paste...
    vmap <Leader>y "+y
    vmap <Leader>d "+d
    nmap <Leader>p "+p
    nmap <Leader>P "+P
    nmap <Leader><Leader> V
    vnoremap <C-c> "*y<CR>
    vnoremap y "*y<CR>
    nnoremap Y "*Y<CR>
    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
    "nmap <Leader>a :%y+<CR>
    nmap <Leader>a ggvG$

" edition
    " align blocks of text and keep them selected
    vmap < <gv
    vmap > >gv
    noremap <leader>< :Autoformat<CR>
    " toggle comment
    " gc{motion}   :: Toggle comments
    " gcc          :: Toggle comment for the current line
    " gc           :: Toggle comments (visual mode)
    vnoremap <c-/> :TComment<cr>

" scala (ensime)

" jj to escape insert mode
imap jj <ESC>


" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
