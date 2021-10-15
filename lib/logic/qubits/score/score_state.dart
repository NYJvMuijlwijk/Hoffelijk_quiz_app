part of 'score_cubit.dart';

class ScoreState extends Equatable {
  final int correctAnswers;
  final int score;

  const ScoreState({this.correctAnswers = 0, this.score = 0});

  @override
  List<Object> get props => [correctAnswers, score];

  ScoreState copyWith({
    int? correctAnswers,
    int? score,
  }) {
    return ScoreState(
      correctAnswers: correctAnswers ?? this.correctAnswers,
      score: score ?? this.score,
    );
  }
}
