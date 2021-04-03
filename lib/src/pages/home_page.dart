import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/widgets/game.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/src/providers/game_provider.dart';
import 'package:tic_tac_toe/src/models/game_model.dart';
import 'package:tic_tac_toe/src/widgets/gameOver.dart';

class HomePage extends StatelessWidget {
  final String name;

  HomePage({@required this.name});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Consumer<GameProvider>(
      builder: (BuildContext context, GameProvider provider, Widget _) {
        String player =
            provider.getGame.currentPlayer == Player.player1 ? '1' : '2';
        String playerPiece =
            provider.getGame.currentPlayerPiece == BoardPiece.X ? 'X' : 'O';
        bool gameOver = provider.game.isWin || provider.game.isDraw;

        return Scaffold(
          appBar: AppBar(
            title: Text(name),
          ),
          body: Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
              child: Column(
                children: [
                  Text(
                    'Player $player: $playerPiece',
                    style: theme.textTheme.headline1,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: gameOver ? GameOver() : Game()),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: RaisedButton(
                      onPressed: () {
                        Provider.of<GameProvider>(context, listen: false)
                            .reset();
                      },
                      child: Text(
                        "Reset",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
