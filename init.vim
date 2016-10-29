"
" see http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" see https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
"

 " Bundles (via Shouho/dein.vim) {
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/davidb/.config/nvim/bundles')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
"call dein#add('')

call dein#add('ctrlpvim/ctrlp.vim')
"call dein#add('tacahiroy/ctrlp-funky')
call dein#add('bling/vim-airline')
call dein#add('sheerun/vim-polyglot')
call dein#add('neomake/neomake') " alternatives: syntastic
call dein#add('diepm/vim-rest-console')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('Chiel92/vim-autoformat')
call dein#add('michaeljsmith/vim-indent-object') " alternatives: kana/vim-textobj-indent
call dein#add('wellle/targets.vim')
call dein#add('tomtom/tcomment_vim') " alternatives: NERDCommenter
call dein#add('Shougo/deoplete.nvim')
" javascript
"call dein#add('maksimr/vim-jsbeautify')
" rust
call dein#add('rust-lang/rust.vim')
call dein#add('racer-rust/vim-racer')

" lazy load on command executed
call dein#add('scrooloose/nerdtree', {'on_cmd': 'NERDTreeToggle'})
"call dein#add('christoomey/vim-sort-motion', {'on_cmd': 'gs'})

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

" }

" CtrlP {
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.gitignore', '.editorconfig']
" }

" Syntastic {
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

let g:neomake_enabled_makers = ['makeprg', 'cargo']
let g:neomake_python_enabled_makers = ['pep8', 'pylint']
let g:neomake_rust_enabled_makers = ['cargo']
let b:neomake_rust_enabled_makers = ['rustc']
let g:neomake_open_list = 2
let g:neomake_serialize = 1

autocmd! BufWritePost * Neomake!

let g:quickfixsigns_protect_sign_rx = '^neomake_'
" }

" Completion {
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer']
" }

" Airline {

" status line always opened
set laststatus=2

let g:airline#extensions#tabline#enabled = 1

"  powerline font
let g:airline_powerline_fonts=1
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
set hidden
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

" Core {
set number
"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set listchars=tab:>·,trail:␣
set list
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
" }

" My Key Mapping
" try to only use Leader
"
let mapleader = "\<Space>"
" open/save file
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
" copy/paste...
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
nmap <Leader><Leader> V
"nmap <Leader>a :%y+<CR>
nmap <Leader>a ggvG$

map <Leader>e :NERDTreeToggle<CR>

" jj to escape insert mode
imap jj <ESC>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
