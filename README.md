# Flutter App Name 

A command-line tool that makes it trivial to set the launcher name for iOS and Android Flutter apps. Works with Flutter 2.

# Usage

1. Set your dev dependencies and your app's name and id (aka bundleId or applicationId, previously: package name)

```
dev_dependencies:
  flutter_app_name_all: ^0.1.1

flutter_app_name_all:
  name: "My Cool App"
  id: "it.in4matic.flutter_app_name_all"
```

2. Run flutter_app_name_all in your project's directory

```
flutter pub get
flutter pub run flutter_app_name_all
```

# Test

Run the test suite with

`pub run test`
