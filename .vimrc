
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PRE-VIM-PLUG CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set shiftwidth=4
set tabstop=4
set noexpandtab

set t_Co=256
"set termguicolors
set background=dark

" remap leader key
let mapleader = ","

" Before Copilot Plug init, redirect TAB key-map
" Ctrl+E = Copilot assist confirm
" TAB = Coc.nvim auto-complete navigate
" S-TAB = Coc.nvim auto-complete navigate
so ~/.vimrc_coc_copilot

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PRE-VIM-PLUG CONFIGURATION DONE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM-PLUG INITIALIZATION 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

" Colorscheme (Not used)
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'wuelnerdotexe/vim-enfocado'

" Auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" CocInstall-ed extensions (:CocList extensions)
" coc-pairs
" coc-calc
" coc-pyright
" coc-sh
" coc-vimlsp
" coc-clangd
" coc-tsserver
" coc-json
" coc-vimtex (https://www.ejmastnak.com/tutorials/vim-latex/vimtex.html)
" coc-texlab
" coc-snippets
" [N] coc-fzf-preview - not useful
" [N] coc-pylsp

" Treeview
Plug 'scrooloose/nerdtree', {'on' : 'NERDTreeToggle'}

" Easy Comment
Plug 'preservim/nerdcommenter'

" aesthetics
Plug 'itchyny/lightline.vim'
Plug 'junegunn/rainbow_parentheses.vim' " Not working?

" browser plugin (:OpenBrowser)
Plug 'tyru/open-browser.vim'

" fzf installed using Homebrew? (change if want latest)
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
"Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

" snippets for autocomplete
" ultisnips' nice but hard to make it work with coc.nvim
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'honza/vim-snippets' " Snippets for coc.nvim loaded by default (:set runtimepath?)
" vim-vsnips?

" Awesome multi-visual selection plugin (TBD)
"Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" vim easy align
Plug 'junegunn/vim-easy-align'

" vimtex plugin (https://vi.stackexchange.com/questions/2047/what-are-the-differences-between-latex-plugins)
Plug 'lervag/vimtex'
" wiki plugin
"Plug 'vimwiki/vimwiki'

" ? Verilog plugin
"Plug 'vhda/verilog_systemverilog.vim'

" https://github.com/junegunn/goyo.vim ?

" Copilot
Plug 'github/Copilot.vim'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM-PLUG INITIALIZATION DONE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" POST-VIM-PLUG CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Configure Light Line
set laststatus=2

" Configure Colorscheme
"let g:lightline = { 'colorscheme': 'enfocado' }
"let g:enfocado_style = 'nature' " Available: `nature` or `neon`.
"colorscheme enfocado
"colorscheme PaperColor

" Configure NERDTree
"map <C-c> :NERDTreeClose<CR>
map <C-t> :NERDTreeToggle<CR>

" Configure coc.nvim
so ~/.vimrc_coc
so ~/.vimrc_coc_snippets

""""""""""""""""""""""""""""""""""""""""
" coc.nvim key-mappings from .vimrc_coc
""""""""""""""""""""""""""""""""""""""""
""" Most useful: """
" coc-definition: gd
" coc-references: gr
" coc-rename: gR
" show document: K
" coc-implementation: gi
" coc-type-definition: gy
"
""" Less useful: """ 
" here, <leader> is mapped to ","
" coc-codeaction: <leader>a
" coc-format-selected: <leader>f
" coc-fix-current: <leader>qf


" coc.nvim workspace folder (codespace detect)
autocmd FileType python let b:coc_root_patterns = ['.git', '.env']

"" Configure ultisnips
"" Expand trigger with <CR> (default is <TAB>) to avoid conflict with
"" coc.nvim/copilot
"let g:UltiSnipsExpandTrigger="<CR>"
"let g:UltiSnipsJumpForwardTrigger="<TAB>"
"let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"

" WARNING: something is wrong with this setup... 
" python codes are not displayed properly
"" Configure rainbow parentheses
"augroup rainbow_files
"	autocmd!
"	autocmd FileType cpp,verilog,systemverilog,python RainbowParentheses
"augroup END
"let g:rainbow#pairs = [
"	\ ['(', ')'],
"	\ ['[', ']'],
"	\ ['{', '}'],
"	\ ['<', '>'],
"	\ ['"', '"'],
"	\ ['''', ''''],
"	\ ['`', '`'],
"	\ ['/*', '*/'],
"	\ ['//', ']'], 
"	\]

" Configure easy-align (https://github.com/junegunn/vim-easy-align)
" :EasyAlign is sometimes easier
" Example: :EasyAlign*= (align by equal sign)
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Configure fzf.vim
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Configure FZFMru
command! -bang -nargs=? FZFMru call fzf_mru#actions#mru(<q-args>,
    \{
        \'window': {'width': 0.9, 'height': 0.8},
        \'options': [
            \'--preview', 'bat --color=always --style=numbers --line-range :500 {}',
            \'--preview-window', 'up:60%',
            \'--bind', 'ctrl-_:toggle-preview'
        \]
    \}
\)

" Configure nerdcommenter
" Use <C-w> to comment out the current line or text selected in visual
" https://vi.stackexchange.com/questions/8333/configure-custom-key-mapping-for-plugin-actions
let g:NERDCreateDefaultMappings = 0
noremap <C-S-s> <Plug>NERDCommenterToggle " Toggling suffers from constant bugs... assign a new key
noremap <C-s> <Plug>NERDCommenterSexy " ironically, the most stable is the sexiest
noremap <S-s> <Plug>NERDCommenterUncomment
" For some cases custom mapping does not work, should rely on default maps
" ,cc = NERDCommenterComment
" ,cu = NERDCommenterUncomment
" ,cm = NERDCommenterMinimal
let g:NERDCreateDefaultMappings = 1 
let g:NERDSpaceDelims = 0 
let g:NERDCompactSexyComs = 1 
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

"" Configure vim-tmux-navigator
"let g:tmux_navigator_no_mappings = 1
""nnoremap <silent> {C-b-Left} :TmuxNavigateLeft<cr>
""nnoremap <silent> {C-b-Down} :TmuxNavigateDown<cr>
""nnoremap <silent> {C-b-Up} :TmuxNavigateUp<cr>
""nnoremap <silent> {C-b-Right} :TmuxNavigateRight<cr>
""nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
"" Write all buffers before navigating from Vim to tmux pane
"let g:tmux_navigator_save_on_switch = 2
"" Disable tmux navigator when zooming the Vim pane
"let g:tmux_navigator_disable_when_zoomed = 1

" posterior setup - MacOS annoying sidebar
set signcolumn=number
set number

" Italicized comments
"set t_ZH=^[[3m
"set t_ZR=^[[23m
"highlight Comment cterm=italic

" chicken bits
filetype plugin indent on
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" POST-VIM-PLUG CONFIGURATION DONE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" References
" https://github.com/neoclide/coc.nvim/issues/1605
" coc.nvim fuzzy mode should close with Ctrl+C

" old way w/o plugins (deprecated)
"hi clear SpellBad
"hi SpellBad cterm=underline
"
"let g:cpp_function_highlight = 1
"let g:cpp_attributes_highlight = 1
"let g:cpp_member_highlight = 1
"let g:cpp_simple_highlight = 1
"
" use the system clipboard - share with tmux/system clipboard
"set clipboard=unnamedplus "sets the default copy register to be + (+y/+p) --
"weird things happen...
set clipboard=unnamed "sets the default copy register to be * (*y/*p)




