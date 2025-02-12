import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_belajar_anak/app/modules/home/pages/settings/controllers/settings_controller.dart';
import 'package:game_belajar_anak/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  Get.put(SettingsController());
  await GetStorage.init();

  final audioContext = AudioContext(
    android: AudioContextAndroid(
      audioFocus: AndroidAudioFocus.none
    )
  );

  // Either this before creating a player:
  await AudioPlayer.global.setAudioContext(audioContext);

  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]).then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  final settingsController = Get.find<SettingsController>();
  MyApp({super.key}) {
    settingsController.playBacksound();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}