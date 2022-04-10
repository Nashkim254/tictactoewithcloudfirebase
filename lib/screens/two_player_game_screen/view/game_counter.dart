import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/models/userscores.dart';
import 'package:tic_tac_toe/screens/two_player_game_screen/bloc/two_player_bloc.dart';
import 'package:tic_tac_toe/utils/db.dart' as score_database;



class GameCounter extends StatelessWidget {
  const GameCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TwoPlayerBloc, TwoPlayerState>(
      //the win counter will only change when game is starting or game is over
      /// therefore only build this widget when state is [GameInitilize] or GameOver
      buildWhen: (previous, current) {
        return current is TwoPlayerGameOver || current is TwoPlayerGameInitilize;
      },
      builder: (context, state) {
         final database = score_database.openDB();
        int xWins = 0;
        int oWins = 0;
        int draw = 0;
        if (state is TwoPlayerInitialState) {
          xWins = state.xWin;
          oWins = state.oWin;
          draw = state.draw;
        } else if (state is TwoPlayerGameOver) {
          xWins = state.xWins;
          oWins = state.oWins;
          draw = state.draws;
              if (xWins > 0) {
            Score score = Score(
                id: 0,
                scoreDate: DateTime.now().toString(),
                userScore: xWins);
            score_database.manipulateDatabase(score, database);
            print("=========>DB saved");
          }else if(oWins > 0){
             Score score = Score(
                id: 1,
                scoreDate: DateTime.now().toString(),
                userScore: oWins);
            score_database.manipulateDatabase(score, database);
            print("=========>DB saved");
          }else if(draw > 0){
             Score score = Score(
                id: 1,
                scoreDate: DateTime.now().toString(),
                userScore: draw);

            score_database.manipulateDatabase(score, database);
            print("=========>DB saved");
          }
        }
        
        if (state is TwoPlayerInitialState || state is TwoPlayerGameOver) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/x.png",
                      width: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("${xWins.toString()} Wins"),
                  ],
                ),
              )),
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/o.png",
                      width: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("${oWins.toString()} Wins"),
                  ],
                ),
              )),
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/draw.png",
                      width: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("${draw.toString()} Draw"),
                  ],
                ),
              ))
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
