import 'package:flutter/material.dart';
import 'package:hoffelijk_quiz_app/logic/qubits/navigation/navigation_cubit.dart';
import 'package:hoffelijk_quiz_app/logic/qubits/quiz/quiz_cubit.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  static MaterialPageRoute<ScorePage> route() {
    return MaterialPageRoute<ScorePage>(builder: (_) => ScorePage());
  }

  @override
  Widget build(BuildContext context) {
    QuizCubit quizCubit = context.read<QuizCubit>();
    NavigationCubit navigationQubit = context.read<NavigationCubit>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hoffelijk Quiz"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Flexible(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Text(
                    quizCubit.state.noWrongAnswer ? "You Win!" : "You Lost.",
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.all(10.w),
                        primary: Colors.white,
                        onSurface: Colors.grey[800],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.w))),
                    child: Text(
                      "Try Again",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    onPressed: () => quizCubit.StartQuiz(retry: true),
                  ),
                  SizedBox(height: 5.w),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.all(10.w),
                        primary: Colors.white,
                        onSurface: Colors.grey[800],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.w))),
                    child: Text(
                      "Main Menu",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    onPressed: navigationQubit.NavigateToStartPage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
