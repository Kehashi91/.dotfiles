sudo apt install -y \
    build-essential \
    python-setuptools \
    python-pip \
    python-smbus \
    python-dev \
    libsqlite3-dev \
    libc6-dev \
    libbz2-dev \
    libgdbm-dev \
    zlib1g-dev \
    libsqlite3-dev \
    tk-dev \
    openssl \
    libssl-dev \
    libjpeg-dev \
    libffi-dev \
    ca-certificates \
    curl \
    libncursesw5-dev \
    ncurses-dev \
    gnupg \
    git-flow \
    lsb-release


mkdir temp
cd temp
wget https://www.python.org/ftp/python/3.9.15/Python-3.9.15.tgz
tar -xzf Python-3.9.15.tgz
cd Python-3.9.15
./configure
sudo make install
cd ~

pip install powerline-shell

curl https://pyenv.run | bash
pyenv install 3.7.15

curl -sSL https://install.python-poetry.org | python3 -
poetry completions bash >> ~/.bash_completion

cd temp
wget https://download.jetbrains.com/python/pycharm-community-2022.2.4.tar.gz
tar xzf pycharm-*.tar.gz -C
sudo tar xzf pycharm-*.tar.gz -C /opt/
cd ~

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

snap install --classic code
snap install --classic postman


rm -rf temp
