HW01Eにkitkatを食べさせるプロジェクト

pullreq歓迎 要望等は基本放置 なにかあったらissueまで

pullreqする際はトピックブランチを作ってください

ROM配布はしません。 欲しい場合はビルドしてください

```sh
$ mkdir cyanogenmod
$ cd cyanogenmod
$ repo init -u git://github.com/CyanogenMod/android.git -b cm-11.0
$ mkdir .repo/local_manifests
$ vim .repo/local_manifests/roomservice.xml
$ repo sync
$ cd vendor/cm/
$ ./get-prebuilts
$ cd ../..
$ cd device/huawei/hw01e
$ ./extract-files.sh
$ cd ../../..
$ . build/envsetup.sh
$ brunch cm_hw01e-eng
```

.repo/local_manifests/roomservice.xml

```xml
<manifest>
    <!-- 自身のrepoを利用するときはremoteをprivateに変更 -->
    <project name="PyYoshi/android_kernel_huawei_hw01e.git" path="kernel/huawei/hw01e" remote="github" revision="cm-11.0"/>
    <project name="PyYoshi/android_device_huawei_hw01e.git" path="device/huawei/hw01e" remote="github" revision="cm-11.0"/>
</manifest>
```


