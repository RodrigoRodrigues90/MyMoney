// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$counterAtom =
      Atom(name: '_HomeController.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$_HomeControllerActionController =
      ActionController(name: '_HomeController', context: context);

  @override
  void incrementCounter() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.incrementCounter');
    try {
      return super.incrementCounter();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.reset');
    try {
      return super.reset();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter}
    ''';
  }
}
