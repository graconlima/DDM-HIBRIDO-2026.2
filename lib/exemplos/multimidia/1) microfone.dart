//Exemplo 1: mic simples - Descontinuado

/*import 'package:flutter/cupertino.dart';
import 'package:mic_stream/mic_stream.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  
  if(MicStream.shouldRequestPermission(true)) {
    Stream<List<int>>? s = MicStream.microphone(
      audioFormat: AudioFormat.ENCODING_PCM_16BIT,
      audioSource: AudioSource.DEFAULT,
      sampleRate: 44100,
      channelConfig: ChannelConfig.CHANNEL_IN_MONO
    );

    s.listen((d) => print("${d.single}"));
  }
}*/

//Exemplo 2: record
/*import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AudioRecorder ar = AudioRecorder();

  if(await ar.hasPermission()) {
    final s = await ar.startStream(
      RecordConfig(
        encoder: AudioEncoder.pcm16bits,
        sampleRate: 44100,
        numChannels: 1
      )
    );

    s.listen((Uint8List d) => print("Amostra: ${d.take(10).toList()} | tamanho do bloco: ${d.length}"));
  }
}*/

//Exemplo 3: salvando captura em arquivo
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AudioRecorder ar = AudioRecorder();

  if(await ar.hasPermission()) {
    final s = await ar.start(
      RecordConfig(
        encoder: AudioEncoder.aacLc,
        sampleRate: 44100,
        numChannels: 1
      ),
      path: "${(await getApplicationDocumentsDirectory()).path}/gravacao_${DateTime.now().day}.m4a"//getTemporaryDirectory() - dados em cache (ex: ///data/user/0/com.example.ddm_20261/cache/gravacao_869.m4a)
    );

    await Future.delayed(Duration(seconds: 5));
    print(await ar.stop());
  }
}
