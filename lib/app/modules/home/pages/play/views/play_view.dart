import 'package:flutter/material.dart';
import 'package:game_belajar_anak/app/widgets/custom_btn_widget.dart';
import 'package:game_belajar_anak/app/widgets/menu_widget.dart';

import 'package:get/get.dart';

import '../controllers/play_controller.dart';

class PlayView extends GetView<PlayController> {
  const PlayView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomBtn(image: "lib/app/assets/btn-back.png", text: '', onclick: () => Get.back()),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('lib/app/assets/bg.png'), fit: BoxFit.cover),
        ),
        child: Row(
          children: [
            MenuWidget(image: "lib/app/assets/kera.png", onclick: () {})
          ],
        )
      )
    );
  }
}
