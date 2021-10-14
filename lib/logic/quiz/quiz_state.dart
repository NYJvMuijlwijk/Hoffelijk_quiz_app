part of 'quiz_cubit.dart';

@immutable
class QuizState extends Equatable {
  final List<Question> questions;
  final Question currentQuestion;

  QuizState({
    this.questions = const [],
    this.currentQuestion = const Question(),
  });

  @override
  List<Object> get props => [questions];

  QuizState copyWith({
    List<Question>? questions,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
    );
  }
}
