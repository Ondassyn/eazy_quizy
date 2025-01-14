import 'package:eazy_quizy/domain/game/usecases/get_games.dart';
import 'package:eazy_quizy/presentation/home/bloc/games_state.dart';
import 'package:eazy_quizy/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamesDisplayCubit extends Cubit<GamesDisplayState> {
  GamesDisplayCubit() : super(GamesLoading());

  void displayGames() async {
    var returnedData = await sl<GetGamesUseCase>().call();
    returnedData.fold((error) {
      emit(LoadGamesFailure());
    }, (data) {
      emit(GamesLoaded(games: data));
    });
  }
}
