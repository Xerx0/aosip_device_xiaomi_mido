#!/bin/bash

# We now use CAF-HALS
sudo rm -r hardware/qcom/audio-caf/msm8996 
sudo rm -r hardware/qcom/media-caf/msm8996
sudo rm -r hardware/qcom/display-caf/msm8996

# We can clone now...
git clone https://github.com/LineageOS/android_hardware_qcom_audio -b lineage-16.0-caf-8996 hardware/qcom/audio-caf/msm8996 
git clone https://github.com/LineageOS/android_hardware_qcom_media -b lineage-16.0-caf-8996 hardware/qcom/media-caf/msm8996 
git clone https://github.com/LineageOS/android_hardware_qcom_display -b lineage-16.0-caf-8996 hardware/qcom/display-caf/msm8996 

# Set CCache
sudo apt-get install ccache && prebuilts/misc/linux-x86/ccache/ccache -M 65G
export USE_CCACHE=1

# LOS Settings (sometimes build needs that)
git clone https://github.com/LineageOS/android_packages_resources_devicesettings -b lineage-16.0 packages/resources/devicesettings

# Mido setup
git clone https://github.com/Xerx0/aosip_proprietary_vendor_xiaomi -b lineage-16.0 vendor/xiaomi
git clone https://github.com/dracarys18/NotKernel -b pie kernel/xiaomi/msm8953

# Remove AOSIP/POSP dependencies
sudo rm -r vendor/aosip/build/tools/roomservice.py
sudo rm -r vendor/potato/build/tools/roomservice.py

# Custom GCC
git clone https://github.com/Xerx0/aarch64-linux-gnu-8.x prebuilts/gcc/linux-x86/aarch64/aarch64-linux-gnu-8.x/
