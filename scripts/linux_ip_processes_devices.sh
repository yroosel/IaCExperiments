echo Date and time
date
echo ---------
echo System Info
uname -a
echo ---------
echo IP Addresses
ip address | grep "inet " | cut -d " " -f 6 # -c 10-21
echo ---------
ifconfig | grep "inet "
echo ---------
# echo Network Connections
# netstat -ano  | grep CONNECTED
# echo ---------
# echo Linux Hardware
# sudo lshw -short
# echo ---------
echo Active Processes
ps -ef | grep " /usr/"
echo ---------
echo CPU
lscpu
echo Linux Block Devices
lsblk
echo ---------
#echo Linux File System Info
#sudo fdisk -l
#echo ---------











