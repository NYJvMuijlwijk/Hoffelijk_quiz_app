import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoffelijk_quiz_app/logic/quiz/quiz_cubit.dart';
import 'package:sizer/sizer.dart';

import 'package:hoffelijk_quiz_app/views/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(),
      child: Sizer(
        builder: (_, __, ___) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: const StartPage(),
          );
        },
      ),
    );
  }
}
