part of 'quiz_cubit.dart';

@immutable
class QuizState extends Equatable {
  final List<Question> questions;
  final List<Question> usedQuestions;
  final Question currentQuestion;
  final String selectedAnswer;

  final bool noWrongAnswer;

  const QuizState({
    this.questions = const [],
    this.usedQuestions = const [],
    this.currentQuestion = const Question(),
    this.noWrongAnswer = true,
    this.selectedAnswer = "",
  });

  @override
  List<Object> get props {
    return [
      questions,
      usedQuestions,
      currentQuestion,
      noWrongAnswer,
      selectedAnswer,
    ];
  }

  QuizState copyWith({
    List<Question>? questions,
    List<Question>? usedQuestions,
    Question? currentQuestion,
    bool? noWrongAnswer,
    String? selectedAnswer,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      usedQuestions: usedQuestions ?? this.usedQuestions,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      noWrongAnswer: noWrongAnswer ?? this.noWrongAnswer,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
    );
  }
}
