import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:medieval_game/core/constants.dart';
import 'package:medieval_game/game/player/knight/knight_player.dart';

class Village extends StatefulWidget {
  const Village({Key? key}) : super(key: key);

  @override
  State<Village> createState() => _VillageState();
}

class _VillageState extends State<Village> {
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      map: WorldMapByTiled(
        Constants.villageMap,
        forceTileSize: Vector2(32, 32),
      ),
      player: KnightPlayer(position: Vector2(Constants.tileSize * 12, Constants.tileSize * 24)),
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        ),
        directional: JoystickDirectional(),
      ),
    );
  }
}
