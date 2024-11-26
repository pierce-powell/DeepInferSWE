apt-get update
apt-get install -y build-essential zlib1g-dev libffi-dev libssl-dev libsqlite3-dev libreadline-dev libbz2-dev libncurses5-dev libgdbm-dev liblzma-dev tk-dev wget git
cd /tmp
wget https://www.python.org/ftp/python/3.7.16/Python-3.7.16.tgz
tar -xvzf Python-3.7.16.tgz
cd /tmp/Python-3.7.16
./configure --enable-optimizations
make -j$(nproc)
make altinstall
which python3.7
which pip3.7
python3.7 -V
cd /tmp
rm -rf Python-3.7.16
rm -f Python-3.7.16.tgz
strip --strip-unneeded /usr/local/bin/python3.7
strip --strip-unneeded /usr/local/lib/libpython3.7m.a
apt-get remove --purge -y build-essential zlib1g-dev libffi-dev libssl-dev     libsqlite3-dev libreadline-dev libbz2-dev libncurses5-dev libgdbm-dev liblzma-dev tk-dev
apt-get autoremove -y
apt-get clean
python3.7 -m ensurepip --upgrade
python3.7 -m pip install --upgrade pip setuptools wheel
ln -s /usr/local/bin/python3.7 /usr/local/bin/python3
ln -s /usr/local/bin/python3.7 /usr/local/bin/python
cd /
