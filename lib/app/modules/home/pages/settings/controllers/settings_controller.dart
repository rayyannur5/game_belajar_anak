import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {

  final AudioPlayer _player = AudioPlayer(playerId: "play");
  final AudioPlayer _backsound = AudioPlayer(playerId: "play2");
  final isBacksoundPlay = true.obs;
  GetStorage storage = GetStorage();

  @override
  void onInit() {
    isBacksoundPlay.value = storage.read('backsound') ?? true;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onOffBackSound(value) async {
    isBacksoundPlay.value = value;
    storage.write('backsound', value);
  }

  void playBacksound() async{
    if(isBacksoundPlay.value) {
      _backsound.setReleaseMode(ReleaseMode.loop);
      ByteData bytes = await rootBundle.load("lib/app/assets/sounds/bg-sound.mp3"); //load sound from assets
      Uint8List soundbytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

      _backsound.setVolume(0.05);
      _backsound.play(BytesSource(soundbytes));
    }
  }

  void playSound(asset) async {
    ByteData bytes = await rootBundle.load(asset); //load sound from assets
    Uint8List soundbytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    _player.play(BytesSource(soundbytes));
  }
}
