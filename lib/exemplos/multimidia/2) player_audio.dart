import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AudioPlayer ap = AudioPlayer();
  await ap.play(
    DeviceFileSource(
      "${(await getApplicationDocumentsDirectory()).path}/gravacao_${DateTime.now().day}.m4a"
    )
  );
}
