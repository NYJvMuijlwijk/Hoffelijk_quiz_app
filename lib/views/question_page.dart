import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoffelijk_quiz_app/logic/qubits/quiz/quiz_cubit.dart';
import 'package:sizer/sizer.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key}) : super(key: key);

  static MaterialPageRoute<QuestionPage> route() {
    return MaterialPageRoute<QuestionPage>(builder: (_) => QuestionPage());
  }

  @override
  Widget build(BuildContext context) {
    QuizState state = context.read<QuizCubit>().state;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hoffelijk Quiz"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Text(
                    state.currentQuestion.question,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      for (String answer in state.currentQuestion.getAllAnswers()..shuffle())
                        Expanded(
                          child: _QuizAnswer(answer: answer),
                        ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _QuizAnswer extends StatelessWidget {
  const _QuizAnswer({
    Key? key,
    required this.answer,
  }) : super(key: key);

  final String answer;

  @override
  Widget build(BuildContext context) {
    QuizCubit quizCubit = context.read<QuizCubit>();

    return Padding(
      padding: EdgeInsets.all(3.w),
      child: BlocBuilder<QuizCubit, QuizState>(
        buildWhen: (p, c) => p.selectedAnswer != c.selectedAnswer,
        builder: (context, state) {
          BorderSide border;

          if (state.selectedAnswer.isNotEmpty && state.selectedAnswer == answer)
            border = BorderSide(
              color: state.currentQuestion.answer == answer ? Colors.green : Colors.red,
              width: 1.w,
            );
          else if (state.selectedAnswer.isNotEmpty && state.currentQuestion.answer == answer)
            border = BorderSide(
              color: Colors.green.withOpacity(0.5),
              width: 1.w,
            );
          else
            border = BorderSide.none;

          return TextButton(
            style: TextButton.styleFrom(
              enableFeedback: state.selectedAnswer.isEmpty,
              backgroundColor: Colors.grey,
              padding: EdgeInsets.all(3.w),
              primary: Colors.white,
              onSurface: state.selectedAnswer == answer ? Colors.white : Colors.grey[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.w),
                side: border,
              ),
            ),
            onPressed: state.selectedAnswer.isNotEmpty ? null : () => quizCubit.SubmitAnswer(answer),
            child: Center(
              child: Text(
                answer,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
          );
        },
      ),
    );
  }
}
