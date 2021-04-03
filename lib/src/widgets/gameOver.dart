import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/src/providers/game_provider.dart';
import 'package:tic_tac_toe/src/models/game_model.dart';

class GameOver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer<GameProvider>(
        builder: (BuildContext context, GameProvider provider, Widget _) {
      String player =
          provider.getGame.currentPlayer == Player.player1 ? '1' : '2';
      String text = '';
      if (provider.game.isWin) {
        text = 'Player $player is the winner!!';
      } else if (provider.game.isDraw) {
        text = 'Tie!';
      }
      return Center(
        child: Container(
            child: Text(
          text,
          style: theme.textTheme.headline1,
        )),
      );
    });
  }
}
