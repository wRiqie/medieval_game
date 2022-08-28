import 'package:bonfire/bonfire.dart';
import 'package:medieval_game/core/constants.dart';

class KnightSprite {
  static Future<SpriteAnimation> _sequenceImage(String fileName) {
    return SpriteAnimation.load(
      'player/$fileName',
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: 0.15,
        textureSize: Vector2(16, 16),
        texturePosition: Vector2(0, 0),
      ),
    );
  }

  static Future<SpriteAnimation> get idleLeft => _sequenceImage(Constants.playerIdleLeft);
  static Future<SpriteAnimation> get idleRight => _sequenceImage(Constants.playerIdleRight);
  static Future<SpriteAnimation> get runLeft => _sequenceImage(Constants.playerRunLeft);
  static Future<SpriteAnimation> get runRight => _sequenceImage(Constants.playerRunRight);
}
