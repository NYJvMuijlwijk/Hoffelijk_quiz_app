import 'package:flutter/material.dart';
import 'package:hoffelijk_quiz_app/logic/qubits/navigation/navigation_cubit.dart';
import 'package:hoffelijk_quiz_app/logic/qubits/quiz/quiz_cubit.dart';
import 'package:hoffelijk_quiz_app/logic/qubits/score/score_cubit.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  static MaterialPageRoute<ScorePage> route() {
    return MaterialPageRoute<ScorePage>(builder: (_) => ScorePage());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonStyle = TextButton.styleFrom(
      backgroundColor: theme.colorScheme.secondary,
      padding: EdgeInsets.all(10.w),
      primary: Colors.white,
      elevation: 5,
      onSurface: Colors.grey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w)),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hoffelijk Quiz"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: const _ScoringText(),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _RetryButton(style: buttonStyle),
                    SizedBox(height: 5.w),
                    _MenuButton(style: buttonStyle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoringText extends StatelessWidget {
  const _ScoringText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizCubit = context.read<QuizCubit>();
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          quizCubit.state.noWrongAnswer ? "You Win" : "You Lose",
          style: theme.textTheme.headline3,
          textAlign: TextAlign.center,
        ),
        const _ScoreDisplay(),
      ],
    );
  }
}

class _ScoreDisplay extends StatelessWidget {
  const _ScoreDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scoreCubit = context.read<ScoreCubit>();
    final style = Theme.of(context).textTheme.headline4;

    return Column(
      children: [
        Text(
          "Your final score was: ${scoreCubit.state.score}",
          style: style,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 3.w),
        Text(
          "Correct anwers: ${scoreCubit.state.correctAnswers}",
          style: style,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _MenuButton extends StatelessWidget {
  final ButtonStyle style;

  const _MenuButton({Key? key, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationQubit = context.read<NavigationCubit>();

    return TextButton(
      style: style,
      child: Text(
        "Main Menu",
        style: TextStyle(fontSize: 16.sp),
      ),
      onPressed: navigationQubit.NavigateToStartPage,
    );
  }
}

class _RetryButton extends StatelessWidget {
  final ButtonStyle style;

  const _RetryButton({Key? key, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizCubit = context.read<QuizCubit>();

    return TextButton(
      style: style,
      child: Text(
        "Try Again",
        style: TextStyle(fontSize: 16.sp),
      ),
      onPressed: () => quizCubit.StartQuiz(retry: true),
    );
  }
}
