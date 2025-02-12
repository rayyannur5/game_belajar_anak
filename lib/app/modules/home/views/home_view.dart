import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_belajar_anak/app/modules/home/pages/play/views/play_view.dart';
import 'package:game_belajar_anak/app/modules/home/pages/study/views/study_view.dart';
import 'package:game_belajar_anak/app/widgets/custom_btn_widget.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {


    exitDialog() {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Image.asset('lib/app/assets/bg-dialog.png'),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40, left: 40, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 80),
                        Text(
                          'Konfirmasi',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(blurRadius: 4, offset: Offset(0, 2), color: Colors.black38),
                              Shadow(blurRadius: 4, offset: Offset(0, 3), color: Colors.black38),
                              Shadow(blurRadius: 5, offset: Offset(0, 1), color: Colors.black38),
                            ],
                          ),
                        ),
                        SizedBox(width: 45),
                        CustomBtn(image: 'lib/app/assets/btn-close.png', text: '', onclick: () => Navigator.of(context).pop()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Apakah kamu ingin keluar ?',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(blurRadius: 4, offset: Offset(0, 2), color: Colors.black38),
                        Shadow(blurRadius: 4, offset: Offset(0, 3), color: Colors.black38),
                        Shadow(blurRadius: 5, offset: Offset(0, 1), color: Colors.black38),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 17),
                      CustomBtn(image: 'lib/app/assets/btn-orange-sm.png', text: 'Tidak', onclick: () => Navigator.of(context).pop()),
                      CustomBtn(
                          image: 'lib/app/assets/btn-orange-sm.png',
                          text: 'Ya',
                          onclick: () {
                            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                          }),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    }


    return Scaffold(
      floatingActionButton: Image.asset('lib/app/assets/btn-info.png', scale: 2),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('lib/app/assets/bg.png'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Image.asset('lib/app/assets/logo-lg.png', scale: 2),
            Expanded(
              child: Stack(
                children: [
                  Align(alignment: Alignment.center, child: Image.asset('lib/app/assets/animals.png')),
                  Positioned(
                    bottom: 0,
                    width: Get.width,
                    child: Image.asset('lib/app/assets/nav.png', fit: BoxFit.contain),
                  ),
                  Positioned(
                    width: Get.width,
                    bottom: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomBtn(image: "lib/app/assets/btn-orange.png", text: 'Belajar', onclick: () {
                          Get.to(StudyView());
                        }),
                        CustomBtn(image: "lib/app/assets/btn-orange.png", text: 'Bermain', onclick: () {
                          Get.to(PlayView());
                        }),
                        CustomBtn(image: "lib/app/assets/btn-red.png", text: 'Keluar', onclick: () {
                          exitDialog();
                        }),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

  }

}
