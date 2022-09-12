import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class ExitMapSensor extends GameDecoration with Sensor {
  final String id;
  final VoidCallback exitMap;
  bool hasContact = true;

  ExitMapSensor({
    required this.id,
    required this.exitMap,
    required Vector2 position,
    required Vector2 size,
  }) : super(
          position: position,
          size: size,
        );

  @override
  void onContact(GameComponent component) {
    if (!hasContact && component is Player) {
      exitMap();
      hasContact = true;
    }
  }

  @override
  void onContactExit(GameComponent component) {
    if (hasContact && component is Player) hasContact = false;
  }
}
