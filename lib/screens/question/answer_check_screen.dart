import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/configs/themes/custom_text_style.dart';
import 'package:flutter_quiz_app/controllers/question_paper/questions_controller.dart';
import 'package:flutter_quiz_app/screens/question/result_screen.dart';
import 'package:flutter_quiz_app/widgets/common/background_decoration.dart';
import 'package:flutter_quiz_app/widgets/common/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../widgets/content_area.dart';
import '../../widgets/questions/answer_card.dart';


class AnswerCheckScreen extends GetView<QuestionsController> {
  const AnswerCheckScreen({Key? key}) : super(key: key);

  static String routeName = '/answerCheckScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx(()=> Text('Q. ${(controller.questionIndex.value+1)
            .toString().padLeft(2, '0')}', style: appBarTS,),),
        showActionIcon: true,
        onMenuActionTap: (){
          Get.toNamed(ResultScreen.routeName);
        },

      ),
      body: BackgroundDecoration(
        child: Obx(
            ()=> Column(
              children: [
                Expanded(child: ContentArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 25),
                    child: Column(
                      children: [
                        Text(controller.currentQuestion.value!.question, style: questionTS,),
                        GetBuilder<QuestionsController> (id: 'answer_review_List', builder: (_){
                          return ListView.separated(
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(top: 25),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                final answer = controller.currentQuestion.value!.answers[index];
                                final selectedAnswer = controller.currentQuestion.value!.selectedAnswer;
                                final correctAnswer = controller.currentQuestion.value!.correctAnswer;
                                String answerText = '${answer.identifier}. ${answer.answer}';

                                if(correctAnswer == selectedAnswer && answer.identifier == selectedAnswer){
                                  return CorrectAnswer(answer: answerText);
                                }
                                else if(selectedAnswer == null){
                                  return NotAnswered(answer: answerText);
                                }
                                else if(selectedAnswer != correctAnswer && answer.identifier == selectedAnswer){
                                  return WrongAnswer(answer: answerText);
                                }
                                else if(correctAnswer == answer.identifier){
                                  return CorrectAnswer(answer: answerText);
                                }

                                return AnswerCard(
                                  answer: answerText,
                                  onTap: () {},
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
                              itemCount: controller.currentQuestion.value!.answers.length
                          );
                        }),

                      ],
                    ),
                  ),
                ))
              ],
            )
        ),
      ),
    );
  }
}
