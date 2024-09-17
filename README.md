# Patch-RDTSC-Linux-Kernel

Automated kernel building, patching, and installation aimed at preventing detection of VMs via rdtsc in KVM. To get started, execute patch-rdtsc-linux-kernel.sh in a terminal. This script downloads the latest 5.10.X Linux kernel (currently 5.10.226), then applies patches created by DonnerPartyOf1, and installs the kernel. Keep in mind that the patched kernel could render your system unusable and you will want to boot with a different kernel should you run into any issues.

Please see the following README for more information and additional steps you will want to follow to patch QEMU and build your Virtual Machine properly:

https://gitlab.com/DonnerPartyOf1/kvm-hidden/-/blob/master/README.md
