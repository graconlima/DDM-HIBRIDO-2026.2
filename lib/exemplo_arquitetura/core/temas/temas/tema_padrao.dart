import '../tokens/token_cores.dart';
import 'package:flutter/material.dart';

ThemeData padraoLight = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: CorTokens.padrao,
    brightness: Brightness.light,

  ),
);

ThemeData padraoDark = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: CorTokens.padrao,
    brightness: Brightness.dark,
  ),
);