import 'package:flutter/material.dart';
import 'package:hoffelijk_quiz_app/logic/quiz/quiz_cubit.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizCubit quizCubit = context.read<QuizCubit>();

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.all(3.w),
              primary: Colors.white,
              onSurface: Colors.grey[800],
            ),
            child: Text(
              "Start Quiz",
              style: TextStyle(fontSize: 16.sp),
            ),
            onPressed: () => quizCubit.StartQuiz(context),
          ),
        ),
      ),
    );
  }
}
