import 'package:eazy_quizy/domain/game/entity/game.dart';

abstract class GamesDisplayState {}

class GamesLoading extends GamesDisplayState {}

class GamesLoaded extends GamesDisplayState {
  final List<GameEntity> games;
  GamesLoaded({required this.games});
}

class LoadGamesFailure extends GamesDisplayState {}
