import 'package:flutter/material.dart';
import 'package:game_belajar_anak/app/modules/home/pages/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';

class CustomBtn extends StatefulWidget {
  CustomBtn({super.key, required this.image, required this.text, required this.onclick});
  final Function onclick;
  final String image;
  final String text;

  @override
  State<CustomBtn> createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
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
        settingsController.playSound('lib/app/assets/sounds/button.wav');
        setState(() {
          ontap = true;
        });
      },
      child: AnimatedScale(
        duration: Duration(milliseconds: 100),
        scale: ontap ? 0.8 : 1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(widget.image, scale: 2),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(blurRadius: 4, offset: Offset(0, 2), color: Colors.black38),
                  Shadow(blurRadius: 4, offset: Offset(0, 3), color: Colors.black38),
                  Shadow(blurRadius: 5, offset: Offset(0, 1), color: Colors.black38),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
