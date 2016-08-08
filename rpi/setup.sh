# sudo dd bs=1M if=image.img of=/dev/[XXX]
# raspi-config -> internationalization (5) -> keyboard setup
# configure wifi (/etc/wpa_supplicant/wpa_supplicant.conf)

apt-get update && apt-get -y upgrade

apt-get -y install tcpdump python-pip python-dev bluetooth libbluetooth-dev git mercurial python-usb python-crypto python-serial libgcrypt-dev

pip install pybluez

hg clone https://bitbucket.org/secdev/scapy-com
cd scapy-com && python setup.py install && cd ..

git clone https://github.com/jdongian/killerbee.git
cd killerbee && python setup.py install && cd ..

cp killerbee/rpi/bt.py killerbee/rpi/wardrive.sh /usr/bin
chmod +x /usr/bin/bt.py /usr/bin/zbwardrive.sh

cp killerbee/rpi/iot-setup /etc/init.d
update-rc.d iot-setup defaults