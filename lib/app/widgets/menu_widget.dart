import 'package:flutter/material.dart';
import 'package:game_belajar_anak/app/modules/home/pages/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';

class MenuWidget extends StatefulWidget {
  MenuWidget({super.key, required this.image, required this.onclick});
  final String image;
  final Function onclick;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  final settingsController = Get.find<SettingsController>();

  bool ontap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        setState(() {
          ontap = false;
        });
        Future.delayed(Duration(milliseconds: 100), () => widget.onclick());
      },
      onTapDown: (details) {
        settingsController.playSound("lib/app/assets/sounds/button.wav");
        setState(() {
          ontap = true;
        });
      },
      child: AnimatedScale(
        duration: Duration(milliseconds: 100),
        scale: ontap ? 0.8 : 1,
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(widget.image),
              )),
        ),
      ),
    );
  }
}
