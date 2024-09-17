# Download patches
git clone https://gitlab.com/DonnerPartyOf1/kvm-hidden.git

# Download/patch the kernel
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.10.226.tar.xz
tar -xf linux-5.10.226.tar.xz
cd linux-5.10.226
patch -p1 < ../kvm-hidden/rdtscv2.patch

# Get core count - 2 for faster make, e.g. if you have 8 cores, 6 will 
# be used by make
CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
CORES=$(($CORES - 2))

# Fix for error: ISO C90 forbids mixed declarations and code
sed -i 's/KBUILD_CFLAGS += -Wdeclaration-after-statement/#KBUILD_CFLAGS += -Wdeclaration-after-statement/' Makefile

# Build and install the kernel
cp ../.config .
sudo apt install libelf-dev -y
make -j$CORES bzImage
make -j$CORES modules
sudo make install && sudo make modules_install
sudo update-initramfs -c -k 5.10.226 && sudo update-grub2

# Reboot
read -p "Finished! Make sure to boot via 5.10.226 kernel, press enter to reboot..."
sudo reboot
