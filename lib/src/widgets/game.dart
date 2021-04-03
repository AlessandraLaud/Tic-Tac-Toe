import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/src/providers/game_provider.dart';

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer<GameProvider>(
        builder: (BuildContext context, GameProvider provider, Widget _) {
      return Container(
          child: GridView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: provider.getGame.board.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              provider.makeMove(index);
            },
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: 100,
              child: Text(
                provider.getBoardPiece(index),
                style: theme.textTheme.bodyText1,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: theme.primaryColor, width: 5)),
            ),
          );
        },
      ));
    });
  }
}
