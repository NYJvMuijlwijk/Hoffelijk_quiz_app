# hoffelijk_quiz_app

Demo project for Hoffelijk consisting of a simple quiz app made with Flutter. 

## Getting Started

By installing the provided apk file on your android device/emulator, the app can be run without needing the project. At this point in time this app is not designed with tablets or web in mind. Therefore it should be run on a device with mobile dimensions.

To run this app from the project, Flutter will need to be installed on your computer. See https://flutter.dev/docs/get-started/install.

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

## Final Thoughts

Looking back on the progress I definitely noticed I had some remembering to do of things like flutter widgets, navigation etc. This caused some things to take longer than I'd hoped, but in the end I felt like I was already much closer to the pace I'm used to working at when I was using flutter daily.

As far as the end result of this project, I'd say I'm satisfied with how it turned out by managing to incorporate all the points layed out in the exercise. My main point of self critique, and what I would try to improve given more time, is the overall styling and layout of the app. While there is no bad positioning or sizing issues, in my own opinion it might be a bit too simple. I see myself as more focused on the functional aspect and less on the design side of things. Therefore I don't think I was fully able to show my ability to implement more complex layouts by not having a design ready from the start. Though argueably this project might not be the best candidate for that in the first place having a small timeframe.

A final thing I might want to add would be some form of counter to communicate the amount of correct answers and answers needed to complete the quiz. Currently it just navigates to the scorescreen saying you won wich might be confusing as there is no victory condition given prior to starting the quiz. I think this would look better than simply saying on the start screen: "Answer 5 questions correctly to win".
