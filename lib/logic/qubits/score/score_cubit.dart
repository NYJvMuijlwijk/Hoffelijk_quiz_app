import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'score_state.dart';

/**
 * This cubit handles the tracking of the player's score and correct answers.
 */
class ScoreCubit extends Cubit<ScoreState> {
  ScoreCubit() : super(const ScoreState());

  void IncreaseScore(int addedScore) {
    emit(state.copyWith(
      correctAnswers: state.correctAnswers + 1,
      score: state.score + addedScore,
    ));
  }

  void Reset() {
    emit(const ScoreState());
  }
}
