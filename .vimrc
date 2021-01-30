"  " # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # "
"  "  __      __                                                         "
"  " |  \    /  |                                        _               "
"  " |   \  /   |  ______            _                  (_)              "
"  " | |\ \/ /| | |____  \ __    __ |_| ____   __    __  _   _ ___ __    "
"  " | | \  / | |  /  _  | \ \  / /    /  __|  \ \  / / | | |  _   _  \  "
"  " | |  \/  | | |  |_| |  \ \/ /     \___ \   \ \/ /  | | | | | | | |  "
"  " |_|      |_|  \_____/   \__/      |____/    \__/   |_| |_| |_| |_|  "
"  " # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # "
"
"     This vim is greatly inspired by spf13-vim: Steve Francia's Vim
"     Distribution. Check out their awesome vim at https://vim.spf13.com.
"
"     Source:
"     https://github.com/spf13/spf13-vim.git


" Basic {
    execute pathogen#infect()
    set background=dark
    syntax on                       " Syntax highlighting
    filetype plugin indent on       " Automatically detect file types
    set mouse=a                     " Automatically enable mouse usage
    set mousehide                   " Hide the mouse cursor while typing
    scriptencoding utf-8

    set virtualedit=onemore         " Allow for cursor beyond last character
    set history=500                 " Store a ton of history (default is 20)
    set nospell                     " Spell checking off
    set hidden                      " Allow buffer switching without saving

    " Setting up the directories {
        set backup
        if has('persistent_undo')
            set undofile
            set undolevels=1000     " Maximum number of changes that can be undone
            set undoreload=10000    " Maximum number lines to save for undo on a buffer reload
        endif
    " }
" }

" Vim UI {
    set termguicolors               " Enable full-color support
    colorscheme palenight           " Load a colorscheme
    set fillchars+=vert:\           " Get rid of pipe characters in VertSlip
    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode
    set cursorline                  " Highlight current line
    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode

    set backspace=indent,eol,start
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

    " Use TAB to complete when typing words, else inserts TABs as usual.
    " Uses dictionary and source files to find matching words to complete.
    function! Tab_Or_Complete()
        if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
            return "\<C-N>"
        else
            return "\<Tab>"
        endif
    endfunction
    inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
    set dictionary="/usr/dict/words"
" }

" Formatting {
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
" }

" vim-plug {
    " To download plugins in ~/.vim/plugged, set var = 0. OR
    " To download plugins in ~/.vim/bundle, set var = 1. FINALLY
    " Run :PlugInstall
    let var = 0

    if var
        " Plugins will be downloaded under the specified directory.
         call plug#begin('~/.vim/bundle/')

        " Declare the list of plugins.
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'Townk/vim-autoclose'
        Plug 'alvan/vim-closetag'
        Plug 'gko/vim-coloresque'
        Plug 'Shougo/deoplete-clangx'
        Plug 'artur-shaik/vim-javacomplete2'
        Plug 'tpope/vim-fugitive'
        Plug 'Shougo/neco-syntax'
        Plug 'Shougo/neosnippet.vim'
        Plug 'Shougo/neosnippet-snippets'
        Plug 'scrooloose/nerdcommenter'
        Plug 'scrooloose/nerdtree'
        Plug 'jistr/vim-nerdtree-tabs'
        Plug 'drewtempelmeyer/palenight.vim'
        Plug 'frazrepo/vim-rainbow'
        Plug 'keith/swift.vim'
        Plug 'vim-syntastic/syntastic'
        Plug 'TheCodedSelf/syntastic-swift'
        Plug 'majutsushi/tagbar'

        " List ends here. Plugins become visible to Vim after this call.
        call plug#end()
    else
        " Plugins will be downloaded under the specified directory.
        call plug#begin('~/.vim/plugged/')

        " Declare the list of plugins.
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/vim-hug-neovim-rpc'
        Plug 'roxma/nvim-yarp'
        " List ends here. Plugins become visible to Vim after this call.
        call plug#end()
    endif
" }

" Plugins {
    " Airline {
        if isdirectory(expand("~/.vim/bundle/vim-airline/"))
            let g:airline#extensions#tabline#enabled = 1
            let g:airline#extensions#tabline#formatter = 'unique_tail'
        endif
    " }

    " Airline Clock {
        if isdirectory(expand("~/.vim/bundle/vim-airline-clock/"))
            let g:airline#extensions#clock#format = '%a, %m/%d %H:%M'
        endif
    " }

    " Airline Themes {
        " Default in terminal vim is 'dark'
        if isdirectory(expand("~/.vim/bundle/vim-airline-themes/"))
            if !exists('g:airline_theme')
                let g:airline_theme = 'minimalist'
            endif

            let g:airline_powerline_fonts = 1
        endif
    " }

    " Deoplete {
        if isdirectory(expand("~/.vim/plugged/deoplete.nvim/"))
            let g:deoplete#enable_at_startup = 1
            let g:deoplete#omni_patterns = {}
            let g:deoplete#auto_completion_start_length = 2

            call deoplete#custom#var('omni', 'input_patterns', {
                \ 'java': '[^. *\t]\.\w*',
                \ 'php': '\w+|[^. \t]->\w*|\w+::\w*',
                \ 'javascript': '[^. *\t]\.\w*',
                \ 'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],
                \ 'ocaml': '[^. *\t]\.\w*|\s\w*|#',
                \})
        endif
    " }

    " Java Complete 2 {
        if isdirectory(expand("~/.vim/bundle/vim-javacomplete2/"))
            autocmd FileType java setlocal omnifunc=javacomplete#Complete
        endif
    " }

    " Merlin {
        let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
        execute "set rtp+=" . g:opamshare . "/merlin/vim"
    " }

    " Neosnippet {
        " Plugin key-mappings.
        " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
        imap <C-k>     <Plug>(neosnippet_expand_or_jump)
        smap <C-k>     <Plug>(neosnippet_expand_or_jump)
        xmap <C-k>     <Plug>(neosnippet_expand_target)

        " SuperTab like snippets behavior.
        " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
        "imap <expr><TAB>
        " \ pumvisible() ? "\<C-n>" :
        " \ neosnippet#expandable_or_jumpable() ?
        " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
        smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

        " For conceal markers.
        if has('conceal')
            set conceallevel=2 concealcursor=niv
        endif
    " }

    " NerdTree {
        if isdirectory(expand("~/.vim/bundle/nerdtree/"))
            let g:NERDShutUp = 1

            map <C-e> <plug>NERDTreeTabsToggle<CR>
            map <leader>e :NERDTreeFind<CR>
            nmap <leader>nt :NERDTreeFind<CR>

            let NERDTreeShowBookmarks = 1
            let NERDTreeIgnore = ['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            let NERDTreeChDirMode = 0
            let NERDTreeQuitOnOpen = 1
            let NERDTreeMouseMode = 2
            let NERDTreeShowHidden = 1
            let NERDTreeKeepTreeInNewTab = 1
            let g:nerdtree_tabs_open_on_gui_startup = 0
        endif
    " }

    " Rainbow {
        let g:rainbow_active = 1

        let g:rainbow_load_separately = [
            \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
            \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
            \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
            \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
            \ ]

        let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
        let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
    " }

    " Syntastic {
        if isdirectory(expand("~/.vim/bundle/syntastic/"))
            set statusline+=%#warningmsg#
            set statusline+=%{SyntasticStatuslineFlag()}
            set statusline+=%*

            let g:syntastic_always_populate_loc_list = 1
            let g:syntastic_auto_loc_list = 1
            let g:syntastic_check_on_open = 1
            let g:syntastic_check_on_wq = 0

            " Javascript
            let g:syntastic_javascript_checkers = ['eslint']
            let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

            "OCaml
            let g:syntastic_ocaml_checkers = ['merlin']
        endif
    " }

    " Syntastic Swift {
        if isdirectory(expand("~/.vim/bundle/syntastic-swift/"))
            let g:syntastic_aggregate_errors = 1
            let g:syntastic_swift_checkers = ['swift']
        endif
    " }

    " TagBar {
        if isdirectory(expand("~/.vim/bundle/tagbar/"))
            nmap <F8> :TagbarToggle<CR>
        endif
    "}

    " UndoTree {
        if isdirectory(expand("~/.vim/bundle/undotree/"))
            nnoremap <Leader>u :UndotreeToggle<CR>
            " If undotree is opened, it is likely one wants to interact with it.
            let g:undotree_SetFocusWhenToggle = 1
        endif
    " }
"}

" Functions {
    " Initialize NERDTree as needed {
        function! NERDTreeInitAsNeeded()
            redir => bufoutput
            buffers!
            redir END
            let idx = stridx(bufoutput, "NERD_tree")
            if idx > -1
                NERDTreeMirror
                NERDTreeFind
                wincmd l
            endif
        endfunction
    " }
" }
