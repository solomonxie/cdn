# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: MacOS Sierra / Ubuntu
#
#
#
# =======SETING UP SHADOWSOCKS =======

# Install Shadowsocks
echo "========== (INSTALLING SHADOWSOCKS) ==========="
yes | sudo pip install shadowsocks
if [$? != 0]; then
    exit 1;
fi


# Create config file
echo "========== (CREAT SHADOWSOCK'S CONFIG) ==========="
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/server/shadowsocks/shadowsocks.json -O ~/shadowsocks.json
if [$? != 0]; then
    echo "======Failed to create shadowsocks.json====="
    exit 1;
fi

echo "========== (STARTING SHADOWSOCKS SERVER) ==========="
sudo ssserver -c ~/shadowsocks.json -d start
if [$? != 0];then
    echo "====Error occurred when starting the shadowsocks====="
fi