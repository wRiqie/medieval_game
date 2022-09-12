import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:medieval_game/core/constants.dart';
import 'package:medieval_game/game/levels/village.dart';
import 'package:medieval_game/game/player/knight/knight_player.dart';
import 'package:medieval_game/utils/extensions.dart';

import '../../utils/exit_map_sensor.dart';

class WorldRegionsMap extends StatefulWidget {
  final Vector2? playerPosition;
  const WorldRegionsMap({Key? key, this.playerPosition}) : super(key: key);

  @override
  State<WorldRegionsMap> createState() => _WorldRegionsMapState();
}

class _WorldRegionsMapState extends State<WorldRegionsMap> {
  @override
  void initState() {
    super.initState();
    FlameAudio.bgm.play(Constants.bg);
  }

  @override
  void dispose() {
    super.dispose();
    FlameAudio.bgm.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      map: WorldMapByTiled(
        Constants.worldMap,
        forceTileSize: Vector2(32, 32),
      ),
      player: KnightPlayer(
        position: widget.playerPosition ??
            Vector2(Constants.tileSize * 9, Constants.tileSize * 14),
      ),
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        ),
        directional: JoystickDirectional(),
      ),
      
      components: [
        ExitMapSensor(
          id: 'villageSensor',
          exitMap: () {
            context.goTo(const Village());
          },
          position: Vector2(Constants.tileSize * 6, Constants.tileSize * 14),
          size: Vector2(
            Constants.tileSize * 1,
            Constants.tileSize * 2,
          ),
        ),
      ],
    );
  }
}
