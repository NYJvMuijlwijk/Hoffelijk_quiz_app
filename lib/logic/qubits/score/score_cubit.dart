import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'score_state.dart';

class ScoreCubit extends Cubit<ScoreState> {
  ScoreCubit() : super(ScoreState());

  void IncreaseScore(int addedScore) {
    emit(state.copyWith(correctAnswers: state.correctAnswers + 1, score: state.score + addedScore));
  }

  void Reset() {
    emit(ScoreState());
  }
}
