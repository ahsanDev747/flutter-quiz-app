import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/configs/themes/custom_text_style.dart';
import 'package:flutter_quiz_app/configs/themes/ui_parameters.dart';
import 'package:get/get.dart';
import '../../configs/themes/app_icons.dart';
import '../../screens/question/test_overview_screen.dart';
import '../app_circle_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.titleWidget,
    this.leadingWidget,
    this.showActionIcon = false,
    this.onMenuActionTap
  }) : super(key: key);

  final String title;
  final Widget? titleWidget;
  final Widget? leadingWidget;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mobileScreenPadding, vertical: mobileScreenPadding),
        child: Stack(
          children: [
            Positioned.fill(
              child: titleWidget == null? Center(child: Text(title, style: appBarTS,))
                  : Center(child: titleWidget,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leadingWidget?? Transform.translate(offset: const Offset(-14, 0),
                  child: const BackButton(),),
                if(showActionIcon)
                  Transform.translate(offset: const Offset(10, 0),
                  child: AppCircleButton(onTap: onMenuActionTap?? ()=> Get.toNamed(TestOverviewScreen.routeName),
                    child: const Icon(AppIcons.menu),)
                  ),
              ],
            ),
          ],
        ),
      ),

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 80);
}
