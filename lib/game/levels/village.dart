import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:medieval_game/core/constants.dart';
import 'package:medieval_game/game/levels/world_regions_map.dart';
import 'package:medieval_game/game/player/knight/knight_player.dart';
import 'package:medieval_game/utils/exit_map_sensor.dart';
import 'package:medieval_game/utils/extensions.dart';

class Village extends StatefulWidget {
  final Vector2? playerPosition;
  const Village({Key? key, this.playerPosition}) : super(key: key);

  @override
  State<Village> createState() => _VillageState();
}

class _VillageState extends State<Village> {
  @override
  void initState() {
    super.initState();
    FlameAudio.bgm.play(Constants.village);
  }

  @override
  void dispose() {
    super.dispose();
    FlameAudio.bgm.dispose();
  }

  Future<void> returnToWorldMap(BuildContext context) async {
    await context.goTo(
      WorldRegionsMap(
        playerPosition:
            Vector2(Constants.tileSize * 6, Constants.tileSize * 14),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      map: WorldMapByTiled(
        Constants.villageMap,
        forceTileSize: Vector2(32, 32),
      ),
      player: KnightPlayer(
        position: widget.playerPosition ?? Vector2(Constants.tileSize * 12, Constants.tileSize * 24),
      ),
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        ),
        directional: JoystickDirectional(),
      ),
      components: [
        ExitMapSensor(
          id: 'worldMapSensor',
          exitMap: () => returnToWorldMap(context),
          position: Vector2(Constants.tileSize * 11, Constants.tileSize * 24),
          size: Vector2(
            Constants.tileSize * 4,
            Constants.tileSize * 1,
          ),
        ),
      ],
    );
  }
}
