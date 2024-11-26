part of 'achievement_bloc.dart';

sealed class AchievementsState extends Equatable {
  const AchievementsState();

  @override
  List<Object?> get props => [];
}

class AchievementsInitial extends AchievementsState {}

class AchievementsUpdated extends AchievementsState {
  final int totalPoints;

  const AchievementsUpdated(this.totalPoints);

  @override
  List<Object?> get props => [totalPoints];
}
