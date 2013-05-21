if [ ! -d ~/.vim/bundle ]; then
  mkdir -p ~/.vim/bundle
  git clone git@github.com:Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
fi

echo ""
echo "please execute :NeoBundleInstall on vim"
echo ""

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.inputrc ~/.inputrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.zshrc ~/.zshrc


