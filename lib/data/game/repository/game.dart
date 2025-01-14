import 'package:dartz/dartz.dart';
import 'package:eazy_quizy/data/game/models/game.dart';
import 'package:eazy_quizy/data/game/source/game_firebase_service.dart';
import 'package:eazy_quizy/domain/game/repository/game.dart';
import 'package:eazy_quizy/service_locator.dart';

class GameRepositoryImpl extends GameRepository {
  @override
  Future<Either> getGames() async {
    var categories = await sl<GameFirebaseService>().getGames();
    return categories.fold((error) {
      return Left(error);
    }, (data) {
      return Right(
          List.from(data).map((e) => GameModel.fromMap(e).toEntity()).toList());
    });
  }
}
