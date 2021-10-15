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
                child: _CurrentQuestion(),
              ),
            ),
            Expanded(
              flex: 3,
              child: _Answers(),
            )
          ],
        ),
      ),
    );
  }
}

class _CurrentQuestion extends StatelessWidget {
  const _CurrentQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<QuizCubit>().state;
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(3.w),
      child: SingleChildScrollView(
        child: Text(
          state.currentQuestion.question,
          style: theme.textTheme.headline4,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _Answers extends StatelessWidget {
  const _Answers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<QuizCubit>().state;

    return LayoutBuilder(
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
    final quizCubit = context.read<QuizCubit>();
    final theme = Theme.of(context);

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
              color: Colors.green,
              width: 1.w,
            );
          else
            border = BorderSide.none;

          return TextButton(
            style: TextButton.styleFrom(
              enableFeedback: state.selectedAnswer.isEmpty,
              backgroundColor: theme.colorScheme.secondary,
              padding: EdgeInsets.all(5.w),
              primary: Colors.white,
              elevation: 5,
              onSurface: state.selectedAnswer == answer ? Colors.white : Colors.grey[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.w),
                side: border,
              ),
            ),
            onPressed: state.selectedAnswer.isNotEmpty ? null : () => quizCubit.SubmitAnswer(answer),
            child: Center(
              child: Text(
                answer,
                style: theme.textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
