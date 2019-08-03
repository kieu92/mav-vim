Install pathogen: mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

Install vim-plug: curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

In .vimrc, follow the instructions under vim-plug to install plugins.

Double click on all of the files in ~/.vim/bundle/Menlo-for-Powerline and click install.

Install enricobacis/vim-airline-clock with pathogen: git clone https://github.com/enricobacis/vim-airline-clock.git ~/.vim/bundle/vim-airline-clock

Install eslint and pylint.

Basic layout of .vim:

~/.vim/
  - autoload/
      - pathogen.vim
      - plug.vim
  - bundle/
      - gruvbox/
      - Menlo-for-Powerline/
      - neco-syntax/
      - nerdtree/
      - swift.vim/
      - syntastic-swift/
      - syntastic/
      - undotree/
      - vim-airline-clock/
      - vim-airline-themes/
      - vim-airline/
      - vim-autoclose/
      - vim-coloresque/
      - vim-javacomplete2/
      - vim-nerdtree-tabs/
  - plugged/
      - deoplete.nvim/
      - nvim-yarp/
      - vim-hug-neovim-rpc/
