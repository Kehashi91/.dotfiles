for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done

echo "versions:"
echo "python = $python_version"
echo "pycharm = $pycharm_version"


sudo apt install -y \
    build-essential \
    python3-distutils \
    python-setuptools \
    python3-pip \
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
wget https://www.python.org/ftp/python/$python_version/Python-$python_version.tgz
tar -xzf Python-$python_version.tgz
cd Python-$python_version
./configure
sudo make install

pip3 install --upgrade pip
pip3 install powerline-shell

cd ~
curl https://pyenv.run | bash

curl -sSL https://install.python-poetry.org | python3 -

cd temp
wget https://download.jetbrains.com/python/pycharm-community-$pycharm_version.tar.gz
sudo tar -xzf pycharm-*.tar.gz -C /opt/
sudo mv /opt/pycharm-* /opt/pycharm
sudo ln -svf ~/.dotfiles/misc/pycharm.desktop /usr/share/applications/pycharm.desktop
cd ~

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

sudo snap install --classic code
sudo snap install --classic postman

# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
sudo cp misc/docker.source /etc/apt/sources.list.d

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

curl -LsSf https://astral.sh/uv/install.sh | sh

sudo rm -rf temp
cd ~/.dotfiles
