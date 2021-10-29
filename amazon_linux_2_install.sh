# Install.sh
# Target: Amazon Linux 2 Images 
# Don't forget to execute with sudo first!

# (1) Installing and updating basics programs
yum -y update
yum -y install htop git haproxy java-11-openjdk-devel

# (2) Configure haproxy
myhaproxy.txt >> /etc/haproxy/haproxy.cfg
systemctl restart haproxy

# (3) Configure Swap Memory

# (3.1) Create a 2GB File
dd if=/dev/zero of=/swapfile count=2048 bs=1MiB

# (3.2) Grant permissions for root
chmod 600 /swafile

# (3.3) Now that our swap file is more secure, we can tell our system to set up the swap space for use by typing
mkswap /swapfile

# (3.4) Enable swap space
swapon /swapfile

# (3.5) Making swap file permanent
echo "" >> /etc/fstab
echo '/swapfile   swap    swap    sw  0   0' >> /etc/fstab
