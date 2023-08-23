// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registerController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$registerController on _registerController, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_registerController.isFormValid'))
          .value;

  late final _$nomeAtom =
      Atom(name: '_registerController.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_registerController.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$senhaAtom =
      Atom(name: '_registerController.senha', context: context);

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$_registerControllerActionController =
      ActionController(name: '_registerController', context: context);

  @override
  void setNome(String value) {
    final _$actionInfo = _$_registerControllerActionController.startAction(
        name: '_registerController.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_registerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_registerControllerActionController.startAction(
        name: '_registerController.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_registerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo = _$_registerControllerActionController.startAction(
        name: '_registerController.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_registerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
email: ${email},
senha: ${senha},
isFormValid: ${isFormValid}
    ''';
  }
}
