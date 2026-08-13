import '../temas/temas/tema_gov.dart';
import '../temas/temas/tema_padrao.dart';
import 'package:flutter/material.dart';

enum AppThemeType { padrao, govBr, suap }

class FabricaTemas {
  static ThemeData light(AppThemeType type) {
    switch (type) {
      case AppThemeType.govBr:
        return govBrLight;
      //case AppThemeType.suap:
      //  return temaSuapLight;
      default:
        return padraoLight;
    }
  }

  static ThemeData dark(AppThemeType type) {
    switch (type) {
      case AppThemeType.govBr:
        return govBrDark;
//      case AppThemeType.suap:
//        return temaSuapDark;
      default:
        return padraoDark;
    }
  }
}