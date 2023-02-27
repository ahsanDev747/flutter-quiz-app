import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quiz_app/routes/app_routes.dart';
import 'package:flutter_quiz_app/screens/home/home_screen.dart';
import '../../configs/themes/app_colors.dart';
import '../../widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width*0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 65,),
              const SizedBox(height: 40,),
              const Text(
                "This is a study app, you can use it as you want. "
                    "If you understand how this works you would be able to scale it",
                style: TextStyle(fontSize: 18, color: onSurfaceTextColor,),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40,),
              AppCircleButton(
                onTap: () => Get.offAndToNamed("/home"),
                child: const Icon(Icons.arrow_forward, size: 35,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
