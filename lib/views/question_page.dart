import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoffelijk_quiz_app/logic/quiz/quiz_cubit.dart';
import 'package:sizer/sizer.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<QuestionPage>(builder: (_) => QuestionPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hoffelijk Quiz"),
          centerTitle: true,
        ),
        body: BlocBuilder<QuizCubit, QuizState>(
          buildWhen: (p, c) => p.currentQuestion != c.currentQuestion,
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: Center(
                    child: Text(state.currentQuestion.question),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(3.w),
                              child: Card(
                                color: Colors.blueAccent,
                                margin: EdgeInsets.zero,
                                child: Center(
                                  child: Text(state.currentQuestion.answer),
                                ),
                              ),
                            ),
                          ),
                          for (String answer in state.currentQuestion.secundaryAnswers)
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(3.w),
                                child: Card(
                                  color: Colors.blueAccent,
                                  margin: EdgeInsets.zero,
                                  child: Center(
                                    child: Text(answer),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
