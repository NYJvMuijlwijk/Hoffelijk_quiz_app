import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hoffelijk_quiz_app/data/questions.dart';
import 'package:hoffelijk_quiz_app/logic/qubits/score/score_cubit.dart';
import 'package:hoffelijk_quiz_app/views/score_page.dart';
import 'package:meta/meta.dart';

import 'package:hoffelijk_quiz_app/data/classes/question.dart';
import 'package:hoffelijk_quiz_app/logic/qubits/navigation/navigation_cubit.dart';
import 'package:hoffelijk_quiz_app/views/question_page.dart';

part 'quiz_state.dart';

/**
 * This cubit is responsible for the handling of displaying the current question, checking the answers given,
 * and navigating to either the next question page or score page when a wrong answer is given.
 */
class QuizCubit extends Cubit<QuizState> {
  final NavigationCubit _navigationCubit;
  final ScoreCubit _scoreCubit;
  final Duration _navigationWaitTime = const Duration(seconds: 3);

  QuizCubit({required navigationCubit, required scoreCubit})
      : _navigationCubit = navigationCubit,
        _scoreCubit = scoreCubit,
        super(const QuizState());

  /// Starts a new quiz
  ///
  /// Set [retry] to true when you want the current route to be replaced after navigation
  void StartQuiz({bool retry = false}) {
    _scoreCubit.Reset();

    emit(QuizState(
      questions: Questions.GetQuestions()..shuffle(),
    ));

    _NextQuestion(retry);
  }

  /// Gets the next question from the remaining questions.
  ///
  /// [replaceOnCorrect] determines wether the current route gets replaced after navigation
  void _NextQuestion(bool replaceOnCorrect) {
    List<Question> remainingQuestions = state.questions.where((element) => !state.usedQuestions.contains(element)).toList(growable: false);

    if (remainingQuestions.length > 0) {
      final nextQuestion = remainingQuestions.first;
      final questionPageRoute = QuestionPage.route();

      emit(state.copyWith(
        currentQuestion: nextQuestion,
        usedQuestions: [...state.usedQuestions, nextQuestion],
        selectedAnswer: "",
      ));

      replaceOnCorrect ? _navigationCubit.PushReplacementRoute(questionPageRoute) : _navigationCubit.PushRoute(questionPageRoute);
    } else
      _navigationCubit.PushReplacementRoute(ScorePage.route());
  }

  /// Submit the answer for the current question.
  ///
  /// Correct answers will add their score the the total and navigate to the next question if one remains and less than 5 correct answers have been given.
  ///
  /// Incorrect or 5 correct answers will navigate to the scorepage.
  ///
  /// All navigation happens after a small delay.
  void SubmitAnswer(String answer) {
    emit(state.copyWith(selectedAnswer: answer));

    if (answer == state.currentQuestion.answer) {
      _scoreCubit.IncreaseScore(state.currentQuestion.score);
      Future.delayed(
        _navigationWaitTime,
        () => _scoreCubit.state.correctAnswers >= 5 ? _navigationCubit.PushReplacementRoute(ScorePage.route()) : _NextQuestion(true),
      );
    } else {
      emit(state.copyWith(noWrongAnswer: false));
      Future.delayed(_navigationWaitTime, () => _navigationCubit.PushReplacementRoute(ScorePage.route()));
    }
  }
}
