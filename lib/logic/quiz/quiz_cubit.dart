import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hoffelijk_quiz_app/data/question.dart';
import 'package:hoffelijk_quiz_app/views/question_page.dart';
import 'package:meta/meta.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizState());

  void StartQuiz(BuildContext context) {
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

    emit(QuizState(questions: questions, currentQuestion: questions.first));

    Navigator.push(context, QuestionPage.route());
  }
}
