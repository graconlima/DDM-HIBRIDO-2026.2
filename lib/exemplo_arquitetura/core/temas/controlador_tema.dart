/* //Exemplo controlador: Provider

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'fabrica_temas.dart';

//trocar tema, notificar UI, salvar preferências

class ControladorTemaProvider extends ChangeNotifier {
  AppThemeType _themeType = AppThemeType.padrao;
  ThemeMode _themeMode = ThemeMode.system;

  AppThemeType get themeType => _themeType;
  ThemeMode get themeMode => _themeMode;

  /// Inicialização (carrega preferências)
  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    final themeIndex = prefs.getInt('themeType') ?? 0;
    final modeIndex = prefs.getInt('themeMode') ?? 0;

    _themeType = AppThemeType.values[themeIndex];
    _themeMode = ThemeMode.values[modeIndex];

    notifyListeners();
  }

  /// Trocar marca (gov, suap, etc.)
  Future<void> setThemeType(AppThemeType type) async {
    _themeType = type;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeType', type.index);
  }

  /// Trocar modo (light/dark/system)
  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', mode.index);
  }
}*/


//Exemplo controlador: MobX
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'fabrica_temas.dart';

part 'controlador_tema.g.dart';

class ControladorTema = _ControladorTema with _$ControladorTema;

abstract class _ControladorTema with Store {

  @observable
  AppThemeType themeType = AppThemeType.padrao;

  @observable
  ThemeMode themeMode = ThemeMode.system;

  @action
  void setThemeType(AppThemeType type) {
    themeType = type;
  }

  @action
  void setThemeMode(ThemeMode mode) {
    themeMode = mode;
  }
}