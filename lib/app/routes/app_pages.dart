import 'package:game_belajar_anak/app/modules/home/pages/study/bindings/study_binding.dart';
import 'package:game_belajar_anak/app/modules/home/pages/study/views/study_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/pages/play/bindings/play_binding.dart';
import '../modules/home/pages/play/views/play_view.dart';
import '../modules/home/pages/settings/bindings/settings_binding.dart';
import '../modules/home/pages/settings/views/settings_view.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.PLAY,
      page: () => const PlayView(),
      binding: PlayBinding(),
    ),
    GetPage(
      name: _Paths.STUDY,
      page: () => const StudyView(),
      binding: StudyBinding(),
    ),
  ];
}
