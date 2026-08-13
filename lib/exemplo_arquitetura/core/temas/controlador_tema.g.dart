// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controlador_tema.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControladorTema on _ControladorTema, Store {
  late final _$themeTypeAtom = Atom(
    name: '_ControladorTema.themeType',
    context: context,
  );

  @override
  AppThemeType get themeType {
    _$themeTypeAtom.reportRead();
    return super.themeType;
  }

  @override
  set themeType(AppThemeType value) {
    _$themeTypeAtom.reportWrite(value, super.themeType, () {
      super.themeType = value;
    });
  }

  late final _$themeModeAtom = Atom(
    name: '_ControladorTema.themeMode',
    context: context,
  );

  @override
  ThemeMode get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeMode value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  late final _$_ControladorTemaActionController = ActionController(
    name: '_ControladorTema',
    context: context,
  );

  @override
  void setThemeType(AppThemeType type) {
    final _$actionInfo = _$_ControladorTemaActionController.startAction(
      name: '_ControladorTema.setThemeType',
    );
    try {
      return super.setThemeType(type);
    } finally {
      _$_ControladorTemaActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setThemeMode(ThemeMode mode) {
    final _$actionInfo = _$_ControladorTemaActionController.startAction(
      name: '_ControladorTema.setThemeMode',
    );
    try {
      return super.setThemeMode(mode);
    } finally {
      _$_ControladorTemaActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeType: ${themeType},
themeMode: ${themeMode}
    ''';
  }
}
