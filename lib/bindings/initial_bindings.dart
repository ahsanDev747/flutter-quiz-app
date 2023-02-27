import 'package:flutter_quiz_app/controllers/auth_controller.dart';
import 'package:flutter_quiz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';
import '../services/firebase_storage_service.dart';

class InitialBindings implements Bindings{

  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() =>  QuestionPaperController());
  }

}