import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:medieval_game/core/constants.dart';
import 'package:medieval_game/game/player/knight/knight_player.dart';

class WorldMap extends StatefulWidget {
  const WorldMap({Key? key}) : super(key: key);

  @override
  State<WorldMap> createState() => _WorldMapState();
}

class _WorldMapState extends State<WorldMap> {
  @override
  void initState() {
    super.initState();

    // FlameAudio.bgm.play('bg.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      map: WorldMapByTiled(
        Constants.worldMap,
        forceTileSize: Vector2(Constants.tileSize, Constants.tileSize),
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
