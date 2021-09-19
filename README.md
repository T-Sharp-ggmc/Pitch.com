# WeCanTry

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to solve M1 pod install error
Create copy of terminal using Rosetta and launch following commands:
- sudo arch -x86_64 gem install ffi
- arch -x86_64 pod install

## Right way to add firebase reference for ios
- Delete all Pod reference into ios folder
- Run "pod deintegrate"
- Add "GoogleService-info.plist" into Runner.xcworkspace with "Add file to Runner" command 
- Run "flutter run" (this command create pod file)
- Add reference of Firebase into generated pod file
- Run "pod install" or "pod update" to update new reference
- Run "flutter run"

## Step to solve error for module GoogleDataTransport
### clear cached artifacts/dependencies
- rm -rf ~/Library/Developer/Xcode/DerivedData/
- rm -rf ~/Library/Caches/CocoaPods/
- rm -rf clone/ios/Pods/
- pod cache clean --all

### clear flutter
- flutter clean
- flutter pub get
- cd ios

### run pod install
- rm Podfile.lock
- pod install --repo-update
