import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medieval_game/game/levels/village.dart';
import 'package:medieval_game/game/levels/world_map.dart';
import 'package:flame_audio/flame_audio.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlameAudio.bgm.initialize();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Village(),
    );
  }
}
