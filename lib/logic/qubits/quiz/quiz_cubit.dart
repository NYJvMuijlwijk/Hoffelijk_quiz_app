import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hoffelijk_quiz_app/logic/qubits/score/score_cubit.dart';
import 'package:hoffelijk_quiz_app/views/score_page.dart';
import 'package:meta/meta.dart';

import 'package:hoffelijk_quiz_app/data/question.dart';
import 'package:hoffelijk_quiz_app/logic/qubits/navigation/navigation_cubit.dart';
import 'package:hoffelijk_quiz_app/views/question_page.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final NavigationCubit _navigationCubit;
  final ScoreCubit _scoreCubit;
  final Duration _navigationWaitTime = const Duration(seconds: 3);

  QuizCubit({required navigationCubit, required scoreCubit})
      : _navigationCubit = navigationCubit,
        _scoreCubit = scoreCubit,
        super(QuizState());

  void StartQuiz({bool retry = false}) {
    List<Question> questions = [
      Question(
        question: "0",
        answer: "0",
        secundaryAnswers: ["1", "2"],
        score: 0,
      ),
      Question(
        question: "1",
        answer: "1",
        secundaryAnswers: ["2", "3"],
        score: 1,
      ),
      Question(
        question: "2",
        answer: "2",
        secundaryAnswers: ["4", "3"],
        score: 2,
      ),
      Question(
        question: "3",
        answer: "3",
        secundaryAnswers: ["2", "4"],
        score: 3,
      ),
      Question(
        question: "4",
        answer: "4",
        secundaryAnswers: ["2", "3"],
        score: 4,
      ),
      Question(
        question: "5",
        answer: "5",
        secundaryAnswers: ["2", "3"],
        score: 5,
      ),
    ];

    emit(QuizState(
      questions: questions..shuffle(),
    ));

    _scoreCubit.Reset();

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
