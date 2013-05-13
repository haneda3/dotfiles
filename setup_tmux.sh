mkdir -p ~/tmp && cd ~/tmp
wget http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.8/tmux-1.8.tar.gz -O tmux.tar.gz
wget https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz -O libevent.tar.gz
tar zxvf tmux.tar.gz
tar zxvf libevent.tar.gz

cd ~/tmp/libevent-2.0.21-stable/
./configure --prefix=$HOME/bin
make
make install

cd ~/tmp/tmux-1.8/
./configure --prefix=$HOME/bin CPPFLAGS="-I$HOME/bin/include" LDFLAGS="-L$HOME/bin/lib"
make
make install


