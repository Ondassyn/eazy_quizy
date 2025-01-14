import 'package:dartz/dartz.dart';

abstract class GameRepository {
  Future<Either> getGames();
}
