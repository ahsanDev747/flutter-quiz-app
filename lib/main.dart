import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/bindings/initial_bindings.dart';
import 'package:flutter_quiz_app/controllers/theme_controller.dart';
import 'package:flutter_quiz_app/data_uploader_screen.dart';
import 'package:flutter_quiz_app/firebase_options.dart';
import 'package:flutter_quiz_app/routes/app_routes.dart';
import 'package:flutter_quiz_app/screens/introduction/introduction.dart';
import 'package:flutter_quiz_app/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import 'bindings/initial_bindings.dart';
import 'configs/themes/app_dark_theme.dart';
import 'configs/themes/app_light_theme.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(
//       GetMaterialApp(
//         home: DataUploaderScreen(),
//   ));
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes(),
    );
  }
}

