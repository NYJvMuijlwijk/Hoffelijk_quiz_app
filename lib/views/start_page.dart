import 'package:flutter/material.dart';
import 'package:hoffelijk_quiz_app/logic/qubits/quiz/quiz_cubit.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  static MaterialPageRoute<StartPage> route() {
    return MaterialPageRoute<StartPage>(builder: (_) => StartPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: const _WelcomeText(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: const _StartQuizButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.w),
      child: Text(
        "Welkom in deze demo quiz app!",
        style: Theme.of(context).textTheme.headline3,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _StartQuizButton extends StatelessWidget {
  const _StartQuizButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizCubit = context.read<QuizCubit>();

    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.all(10.w),
          primary: Colors.white,
          onSurface: Colors.grey[800],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.w))),
      child: Text(
        "Start Quiz",
        style: TextStyle(fontSize: 16.sp),
      ),
      onPressed: () => quizCubit.StartQuiz(),
    );
  }
}
