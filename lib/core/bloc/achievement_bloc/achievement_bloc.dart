import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'achievement_event.dart';
part 'achievement_state.dart';

class AchievementBloc extends Bloc<AchievementsEvent, AchievementsState> {
  AchievementBloc() : super(AchievementsInitial()) {
    on<AddAchievementPoints>((event, emit) {
      final currentPoints = state is AchievementsUpdated
          ? (state as AchievementsUpdated).totalPoints
          : 0;
      emit(AchievementsUpdated(currentPoints + event.points));
    });
  }
}
