import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/configs/themes/app_colors.dart';
import 'package:flutter_quiz_app/configs/themes/custom_text_style.dart';
import 'package:flutter_quiz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_quiz_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter_quiz_app/screens/home/menu_screen.dart';
import 'package:flutter_quiz_app/screens/home/question_card.dart';
import 'package:flutter_quiz_app/widgets/app_circle_button.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_icons.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../widgets/content_area.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_) => (
        ZoomDrawer(
          controller: _.zoomDrawerController,
          angle: 0.0,
          style: DrawerStyle.defaultStyle,
          menuScreenWidth: double.maxFinite,
          menuBackgroundColor: const Color(0xFF3AC3CB),
          slideWidth: MediaQuery.of(context).size.width*0.6,
          menuScreen: const MyMenuScreen(),
          mainScreen: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCircleButton(
                          onTap: controller.toggleDrawer,
                          child: const Icon(AppIcons.menuLeft),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(AppIcons.peace),
                              Text("Hello friend", style: detailText.copyWith(color: onSurfaceTextColor),),
                            ],
                          ),
                        ),
                        const Text("What do you want to learn today?", style: headerText,),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ContentArea(
                        addPadding: false,
                        child: Obx ( () =>  ListView.separated(
                            padding: UIParameters.mobileScreenPadding,
                            itemBuilder: (BuildContext context, int index){
                              return QuestionCard(model: _questionPaperController.allPapers[index]);
                            },
                            separatorBuilder: (BuildContext context, int index){
                              return const SizedBox(height: 20,);
                            },
                            itemCount: _questionPaperController.allPapers.length),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    )),
    );
  }
}
