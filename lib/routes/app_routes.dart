import 'package:flutter_quiz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_quiz_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter_quiz_app/screens/home/home_screen.dart';
import 'package:flutter_quiz_app/screens/introduction/introduction.dart';
import 'package:flutter_quiz_app/screens/login/login_screen.dart';
import 'package:flutter_quiz_app/services/firebase_storage_service.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../controllers/question_paper/questions_controller.dart';
import '../screens/question/answer_check_screen.dart';
import '../screens/question/questions_screen.dart';
import '../screens/question/result_screen.dart';
import '../screens/question/test_overview_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRoutes{

  static List<GetPage> routes() =>
      [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/introduction", page: () => const AppIntroductionScreen()),
        GetPage(name: "/home", page: ()=> const HomeScreen(),
            binding:  BindingsBuilder((){
              Get.put(FirebaseStorageService());
              Get.put(MyZoomDrawerController());
            })
        ),
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
        GetPage(name: QuestionsScreen.routeName, page: () => const QuestionsScreen(),
            binding:  BindingsBuilder((){
              Get.put<QuestionsController>(QuestionsController());
            })
        ),
        GetPage(name: TestOverviewScreen.routeName, page: () => const TestOverviewScreen()),
        GetPage(name: ResultScreen.routeName, page: () => const ResultScreen()),
        GetPage(name: AnswerCheckScreen.routeName, page: () => const AnswerCheckScreen()),

      ];
}