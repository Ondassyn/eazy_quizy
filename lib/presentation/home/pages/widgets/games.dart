import 'package:eazy_quizy/domain/game/entity/game.dart';
import 'package:eazy_quizy/presentation/home/bloc/games_cubit.dart';
import 'package:eazy_quizy/presentation/home/bloc/games_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Games extends StatelessWidget {
  const Games({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GamesDisplayCubit()..displayGames(),
      child: BlocBuilder<GamesDisplayCubit, GamesDisplayState>(
        builder: (context, state) {
          if (state is GamesLoading) {
            return const CircularProgressIndicator();
          }
          if (state is GamesLoaded) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                _games(state.games)
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _games(List<GameEntity> games) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (contetx, index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    // image: DecorationImage(
                    //   fit: BoxFit.fill,
                    //   image: NetworkImage(
                    //     ImageDisplayHelper.generateGameImageURL(games[index].image),
                    //   )
                    // )
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  games[index].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: games.length),
    );
  }
}
