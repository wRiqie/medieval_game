import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:medieval_game/core/constants.dart';
import 'package:medieval_game/game/player/knight/knight_player.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      map: WorldMapByTiled(
        Constants.map,
        forceTileSize: Vector2(Constants.tileSize, Constants.tileSize),
      ),
      player: KnightPlayer(),
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        ),
      ),
    );
  }
}
