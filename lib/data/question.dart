import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String question;
  final String answer;
  final List<String> secundaryAnswers;

  const Question({
    this.question = "question",
    this.answer = "answer",
    this.secundaryAnswers = const ["1", "2", "3"],
  });

  List<String> getAllAnswers() => [answer, ...secundaryAnswers];

  @override
  List<Object> get props => [question, answer, secundaryAnswers];

  Question copyWith({
    String? question,
    String? answer,
    List<String>? secundaryAnswers,
  }) {
    return Question(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      secundaryAnswers: secundaryAnswers ?? this.secundaryAnswers,
    );
  }
}
