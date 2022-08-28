import 'package:bonfire/bonfire.dart';
import 'package:medieval_game/core/constants.dart';
import 'package:medieval_game/game/player/knight/knight_sprite.dart';

class KnightPlayer extends SimplePlayer with ObjectCollision {
  KnightPlayer()
      : super(
          position: Vector2(Constants.tileSize * 9, Constants.tileSize * 9),
          size: Vector2(
            Constants.tileSize,
            Constants.tileSize,
          ),
          animation: SimpleDirectionAnimation(
            idleLeft: KnightSprite.idleLeft,
            idleRight: KnightSprite.idleRight,
            runLeft: KnightSprite.runLeft,
            runRight: KnightSprite.runRight,
          ),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(20, 20),
            align: Vector2(6, 15)
          )
        ],
      ),
    );
  }
}
