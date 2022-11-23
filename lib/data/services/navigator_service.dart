import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NavigatorService {
  late GlobalKey<NavigatorState> _key;

  GlobalKey<NavigatorState> get key => _key;

  static NavigatorService get to => GetIt.I<NavigatorService>();

  static Future init() async {
    final getIt = GetIt.instance
      ..registerSingleton<NavigatorService>(NavigatorService());
    await getIt<NavigatorService>().create();
  }

  Future create() async {
    _key = GlobalKey<NavigatorState>();
  }

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return _key.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<T?> push<T extends Object?>(Route<T> route) {
    return _key.currentState!.push(route);
  }

  void popUntil(RoutePredicate predicate) {
    _key.currentState!.popUntil(predicate);
  }

  void pop<T extends Object?>([T? result]) {
    _key.currentState!.pop(result);
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Route<T> newRoute, {
    TO? result,
  }) {
    return _key.currentState!.pushReplacement(newRoute, result: result);
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _key.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName, {
    RoutePredicate? predicate,
    Object? arguments,
  }) {
    return _key.currentState!.pushNamedAndRemoveUntil(
      newRouteName,
      predicate ?? (_) => false,
      arguments: arguments,
    );
  }

  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _key.currentState!.popAndPushNamed(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  Future<bool> maybePop<T extends Object?>([T? result]) async {
    return _key.currentState!.maybePop(result);
  }

  bool canPop() {
    return _key.currentState!.canPop();
  }
}
