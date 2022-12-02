sudo apt install -y \
    build-essential \
    python3-distutils \
    python-setuptools \
    python-pip \
    python3-dev \
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
    vim \
    git-flow \
    fonts-powerline \
    ca-certificates \
    curl \
    htop \
    gnupg \
    lsb-release

cd ~
mkdir -p temp
cd temp
wget https://www.python.org/ftp/python/3.9.15/Python-3.9.15.tgz
tar -xzf Python-3.9.15.tgz
cd Python-3.9.15
./configure
sudo make install

pip3 install --upgrade pip
pip3 install powerline-shell

cd ~
curl https://pyenv.run | bash

curl -sSL https://install.python-poetry.org | python3 -

cd temp
wget https://download.jetbrains.com/python/pycharm-community-2022.2.4.tar.gz
sudo tar -xzf pycharm-*.tar.gz -C /opt/
sudo mv /opt/pycharm-* /opt/pycharm
sudo ln -svf ~/.dotfiles/misc/pycharm.desktop /usr/share/applications/pycharm.desktop
cd ~

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

sudo snap install --classic code
sudo snap install --classic postman

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.13.0/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose


sudo rm -rf temp
cd ~/.dotfiles
