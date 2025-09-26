// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _loginController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_loginController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isSuccessAtom =
      Atom(name: '_loginController.isSuccess', context: context);

  @override
  bool get isSuccess {
    _$isSuccessAtom.reportRead();
    return super.isSuccess;
  }

  @override
  set isSuccess(bool value) {
    _$isSuccessAtom.reportWrite(value, super.isSuccess, () {
      super.isSuccess = value;
    });
  }

  late final _$checkDataAsyncAction =
      AsyncAction('_loginController.checkData', context: context);

  @override
  Future<void> checkData(
      {required String emailController,
      required String senhaController,
      required BuildContext buildContext}) {
    return _$checkDataAsyncAction.run(() => super.checkData(
        emailController: emailController,
        senhaController: senhaController,
        buildContext: buildContext));
  }

  late final _$_loginControllerActionController =
      ActionController(name: '_loginController', context: context);

  @override
  void setIsLoading({bool? value}) {
    final _$actionInfo = _$_loginControllerActionController.startAction(
        name: '_loginController.setIsLoading');
    try {
      return super.setIsLoading(value: value);
    } finally {
      _$_loginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsSuccess({bool? value}) {
    final _$actionInfo = _$_loginControllerActionController.startAction(
        name: '_loginController.setIsSuccess');
    try {
      return super.setIsSuccess(value: value);
    } finally {
      _$_loginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void throwException(int code) {
    final _$actionInfo = _$_loginControllerActionController.startAction(
        name: '_loginController.throwException');
    try {
      return super.throwException(code);
    } finally {
      _$_loginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isSuccess: ${isSuccess}
    ''';
  }
}
