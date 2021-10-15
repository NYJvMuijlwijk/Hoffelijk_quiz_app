# hoffelijk_quiz_app

Demo project for Hoffelijk consisting of a simple quiz app made with Flutter

## Getting Started

By installing the provided apk file on your android device/emulator, the app can be run without needing the project.

To run this app from the project, Flutter will need to be installed on your computer. See https://flutter.dev/docs/getstarted/install.

Additionally either a device needs to be connected to your computer (https://stackoverflow.com/questions/54444538/how-do-i-run-test-my-flutter-app-on-a-real-device#answer-54526682) or an emulator needs to be set up.

After this, using the command "flutter pub get" in the console should install all the required packages. The app can then be run by using the command "flutter run --release" and selecting the desired device.

Used packages:

* Flutter Bloc
  * package for implementing the BLoC design pattern in flutter
  * see https://pub.dev/packages/flutter_bloc
* Equatable
  * provides value based equality by overriding the == operator and the objects hashCode
  * see https://pub.dev/packages/equatable
* Sizer
  * package for app responsiveness, % based sizing etc.
  * see https://pub.dev/packages/sizer

The app itself should be self explanatory, consisting of a start, question and score screen.
