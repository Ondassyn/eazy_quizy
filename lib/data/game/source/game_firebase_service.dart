import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class GameFirebaseService {
  Future<Either> getGames();
}

class GameFirebaseServiceImpl extends GameFirebaseService {
  @override
  Future<Either> getGames() async {
    try {
      var games = await FirebaseFirestore.instance.collection('games').get();
      return Right(games.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
