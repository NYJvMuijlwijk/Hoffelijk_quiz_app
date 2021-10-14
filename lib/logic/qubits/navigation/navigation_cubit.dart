import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hoffelijk_quiz_app/views/start_page.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final GlobalKey<NavigatorState> _navigator;

  NavigationCubit(this._navigator) : super(NavigationState());

  void PushRoute(Route route) => _navigator.currentState?.push(route);
  void PushReplacementRoute(Route route) => _navigator.currentState?.pushReplacement(route);
  void NavigateToStartPage() {
    _navigator.currentState?.pushAndRemoveUntil(StartPage.route(), (route) => false);
  }
}
