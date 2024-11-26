part of 'achievement_bloc.dart';

sealed class AchievementsEvent extends Equatable {
  const AchievementsEvent();

  @override
  List<Object?> get props => [];
}

class AddAchievementPoints extends AchievementsEvent {
  final int points;

  const AddAchievementPoints(this.points);

  @override
  List<Object?> get props => [points];
}
