
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