Install pathogen: mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

Install vim-plug: curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

In .vimrc, follow the instructions under vim-plug to install plugins.

Install enricobacis/vim-airline-clock with pathogen: git clone https://github.com/enricobacis/vim-airline-clock.git ~/.vim/bundle/vim-airline-clock

Install eslint and pylint.

Basic layout of .vim:

~/.vim/
  - autoload/
      - pathogen.vim
      - plug.vim
  - bundle/
      - vim-airline/
      - vim-airline-clock/
      - vim-airline-themes/
      - vim-autoclose/
      - vim-closetag/
      - vim-coloresque/
      - deoplete-clangx/
      - gruvbox/
      - vim-javacomplete2/
      - kotlin-vim/
      - neco-syntax/
      - nerdcommenter/
      - nerdtree/
      - palenight.vim/
      - vim-nerdtree-tabs/
      - vim-solarized8/
      - swift.vim/
      - syntastic/
      - syntastic-swift/
      - tagbar/
      - undotree/

  - plugged/
      - deoplete.nvim/
      - nvim-yarp/
      - vim-hug-neovim-rpc/
