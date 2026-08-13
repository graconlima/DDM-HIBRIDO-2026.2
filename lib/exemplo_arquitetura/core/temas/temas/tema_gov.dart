import '../tokens/token_cores.dart';
import 'package:flutter/material.dart';

ThemeData govBrLight = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: CorTokens.govBr,
    brightness: Brightness.light,
  ),
);

ThemeData govBrDark = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: CorTokens.govBr,
    brightness: Brightness.dark,
  ),
);