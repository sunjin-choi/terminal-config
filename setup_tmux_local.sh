
# reference: https://gist.github.com/sudkumar/6062def9d56d946b98b6a3853093ee74
# tested OS: linux (redhat)

# setup folders
mkdir -p $HOME/utilities
mkdir -p $HOME/.local

# install libevent (dependency)
cd ~/utilities
wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
tar xvzf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
./configure --prefix=$HOME/.local --disable-shared
make
make install
cd ..


# install ncurses (dependency)
wget http://invisible-island.net/datafiles/release/ncurses.tar.gz
tar xvzf ncurses.tar.gz
cd ncurses-6.3
./configure --prefix=$HOME/.local
make
make install
cd ..

# install tmux
git clone https://github.com/tmux/tmux.git
cd tmux
./autogen.sh
./configure CFLAGS="-I$HOME/.local/include -I$HOME/.local/include/ncurses" LDFLAGS="-L$HOME/.local/lib -L$HOME/.local/include/ncurses -L$HOME/.local/include"
CPPFLAGS="-I$HOME/.local/include -I$HOME/.local/include/ncurses" LDFLAGS="-static -L$HOME/.local/include -L$HOME/.local/include/ncurses -L$HOME/.local/lib"
make

