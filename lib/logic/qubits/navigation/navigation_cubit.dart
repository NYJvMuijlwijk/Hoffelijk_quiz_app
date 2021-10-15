import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hoffelijk_quiz_app/views/start_page.dart';

part 'navigation_state.dart';

/**
 * Cubit used for navigation withing the app.
 *
 * This cubit holds the globalkey of the navigator state, allowing for navigation without the need for any buildcontext.
 * This elimenates the need for the buildcontext to be present inside a cubit or bloc.
 *
 * It also allows for additional logic when navigating if necessary.
 */
class NavigationCubit extends Cubit<NavigationState> {
  final GlobalKey<NavigatorState> _navigator;

  NavigationCubit(this._navigator) : super(const NavigationState());

  void PushRoute(Route route) => _navigator.currentState?.push(route);
  void PushReplacementRoute(Route route) => _navigator.currentState?.pushReplacement(route);
  void NavigateToStartPage() => _navigator.currentState?.pushAndRemoveUntil(StartPage.route(), (route) => false);
}
