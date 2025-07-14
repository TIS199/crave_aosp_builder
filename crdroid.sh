rm -rf .repo/local_manifests; \
rm -rf {device,vendor,kernel,hardware}/xiaomi; \
repo init --depth=1 --no-repo-verify -u https://github.com/crdroidandroid/android -b 15.0 -g default,-mips,-darwin,-notdefault && \
rm -rf prebuilts/clang/host/linux-x86
/opt/crave/resync.sh && \
git clone https://github.com/crdroidandroid/android_device_xiaomi_lancelot device/xiaomi/lancelot -b 15.0 && \
git clone https://github.com/crdroidandroid/android_device_xiaomi_mt6768-common device/xiaomi/mt6768-common -b 15.0 && \
git clone https://github.com/crdroidandroid/proprietary_vendor_xiaomi_lancelot vendor/xiaomi/lancelot -b 14.0 && \
git clone https://github.com/crdroidandroid/proprietary_vendor_xiaomi_mt6768-common vendor/xiaomi/mt6768-common -b 14.0 && \
git clone https://github.com/crdroidandroid/android_kernel_xiaomi_mt6768 kernel/xiaomi/mt6768 -b 15.0 && \
git clone https://github.com/crdroidandroid/android_hardware_xiaomi hardware/xiaomi -b 15.0 && \
git clone https://github.com/crdroidandroid/android_hardware_mediatek hardware/mediatek -b 15.0 && \
export BUILD_USERNAME=TIS199; \
export BUILD_HOSTNAME=crave; \
export TZ=Asia/Dhaka; \
. build/envsetup.sh && \
breakfast lancelot user && make installclean && mka bacon; \
