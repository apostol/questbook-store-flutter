# Prepare WSL2 for flutter

## Create new distr
- `wsl --export Ubuntu clear.ubuntu.22.tar`
- `wsl --import android ./android ./clear.ubuntu.22.tar`
- `wsl -d android --cd ~`
- `apt-get update`
- `apt-get upgrade`
- `adduser dev`
- update wsl.conf
  ```
  [network]
  hostname=flutter-dev

  [user]
  default=dev
  ```
- add dev user to sudo group
- `wsl -t android`
- `wsl -d android --cd ~`

## Install flutter
- `mkdir -p $HOME/Downloads && cd "$_"`
- `wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.3-stable.tar.xz` [last version](https://docs.flutter.dev/get-started/install/linux)
- `mkdir -p $HOME/Applications && cd "$_"`
- `tar xf ~/Downloads/flutter_linux_3.16.3-stable.tar.xz`
- `echo 'export PATH="$HOME/Applications/flutter/bin:$PATH"' >> $HOME/.bashrc`
- `source $HOME/.bashrc`
- `flutter precache`
- `flutter doctor -v`
- If you are going develop desctop application
  -  `sudo apt-get install clang cmake git ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev`

## Install Java
- `sudo apt install openjdk-21-jre`
- `sudo apt install openjdk-21-jdk`
  
## Install Android commandline-tools
- `mkdir -p $HOME/Downloads && cd "$_"`
- `wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip` [last version](https://developer.android.com/studio)
- `mkdir -p $HOME/Applications/sdk && cd "$_"`
- `unzip ~/Downloads/commandlinetools-linux-10406996_latest.zip`
- `mv ./cmdline-tools ./cmdline-tools/latest`
- `echo 'export ANDROID=$HOME/Applications/sdk' >> $HOME/.bashrc`
- `echo 'export PATH="$ANDROID/cmdline-tools/latest:$PATH"' >> $HOME/.bashrc`
- `echo 'export PATH="$ANDROID/cmdline-tools/latest/bin:$PATH"' >> $HOME/.bashrc`
- `source $HOME/.bashrc`
- `sdkmanager --list`

## Install Android SDK
- `sdkmanager --list`
- choose the version for your goals
- `sdkmanager "system-images;android-30;default;x86_64"`
- `sdkmanager "platforms;android-30"`
- `sdkmanager "platform-tools"`
- `sdkmanager "build-tools;30.0.3"`
- `sdkmanager --licenses`
- `flutter config --android-sdk $ANDROID`
- `echo 'export PATH="$ANDROID/platform-tools:$PATH"' >> $HOME/.bashrc`
- `source $HOME/.bashrc`

## Create emulator
- `avdmanager create avd -n test-emu -k 'system-images;android-30;default;x86_64'`
- `avdmanager list avd`

## Run emulator
- `flutter run emulator --launch test-emu`

## Install Android Studio
[Manual](https://addshore.com/2022/01/installing-android-studio-on-wsl2-for-flutter/)
- `mkdir -p $HOME/Downloads && cd "$_"`
- `wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.1.1.26/android-studio-2023.1.1.26-linux.tar.gz` [last version](https://developer.android.com/studio)
- `mkdir -p $HOME/Applications && cd "$_"`
- `tar xfv $(ls -1t $HOME/Downloads/android-studio-* | head -n1)`
- `flutter config --android-studio-dir $HOME/Applications/android-studio/`
- `alias android-studio=$HOME/Applications/android-studio/bin/studio.sh`



[BLOC](https://bloclibrary.dev)
[Android for Flutter](https://flutter.dev/docs/deployment/android)

```
keytool -genkey -v -keystore c:\Users\USER_NAME\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
keytool -list -v -keystore c:\users\your_user_name\.android\debug.keystore -alias androiddebugkey -storepass <....> -keypass <....>
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass <....> -keypass <....> 
```
signingReport

# recreate models
```flutter pub run build_runner build --delete-conflicting-outputs```
