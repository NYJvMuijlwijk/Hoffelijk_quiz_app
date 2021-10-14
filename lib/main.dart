import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoffelijk_quiz_app/logic/qubits/navigation/navigation_cubit.dart';
import 'package:hoffelijk_quiz_app/logic/qubits/quiz/quiz_cubit.dart';
import 'package:sizer/sizer.dart';

import 'package:hoffelijk_quiz_app/views/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
    final NavigationCubit navigationCubit = NavigationCubit(_navigatorKey);

    return BlocProvider.value(
      value: navigationCubit,
      child: BlocProvider(
        create: (context) => QuizCubit(navigationCubit),
        child: Sizer(
          builder: (_, __, ___) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              navigatorKey: _navigatorKey,
              debugShowCheckedModeBanner: false,
              home: const StartPage(),
            );
          },
        ),
      ),
    );
  }
}
