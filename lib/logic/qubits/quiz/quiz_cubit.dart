import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hoffelijk_quiz_app/views/score_page.dart';
import 'package:meta/meta.dart';

import 'package:hoffelijk_quiz_app/data/question.dart';
import 'package:hoffelijk_quiz_app/logic/qubits/navigation/navigation_cubit.dart';
import 'package:hoffelijk_quiz_app/views/question_page.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final NavigationCubit _navigationCubit;
  final Duration _navigationWaitTime = const Duration(seconds: 3);

  QuizCubit(this._navigationCubit) : super(QuizState());

  void StartQuiz({bool retry = false}) {
    List<Question> questions = [
      Question(
        question: "What is the lowest non negative number?",
        answer: "0",
        secundaryAnswers: ["1", "2"],
      ),
      Question(
        question: "What is 9 + 10?",
        answer: "21",
        secundaryAnswers: ["19", "1"],
      ),
    ];

    emit(QuizState(
      questions: questions..shuffle(),
    ));

    _NextQuestion(retry);
  }

  void _NextQuestion(bool replaceOnCorrect) {
    List<Question> remainingQuestions = state.questions.where((element) => !state.usedQuestions.contains(element)).toList(growable: false);

    if (remainingQuestions.length > 0) {
      Question nextQuestion = remainingQuestions.first;
      emit(state.copyWith(
        currentQuestion: nextQuestion,
        usedQuestions: [...state.usedQuestions, nextQuestion],
        selectedAnswer: "",
      ));
      replaceOnCorrect ? _navigationCubit.PushReplacementRoute(QuestionPage.route()) : _navigationCubit.PushRoute(QuestionPage.route());
    } else
      _navigationCubit.PushReplacementRoute(ScorePage.route());
  }

  void SubmitAnswer(String answer) {
    emit(state.copyWith(selectedAnswer: answer));

    if (answer == state.currentQuestion.answer) {
      Future.delayed(_navigationWaitTime, () => _NextQuestion(true));
    } else {
      emit(state.copyWith(noWrongAnswer: false));
      Future.delayed(_navigationWaitTime, () => _navigationCubit.PushReplacementRoute(ScorePage.route()));
    }
  }
}
