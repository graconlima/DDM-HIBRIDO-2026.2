import 'package:flutter/material.dart';

class CoresCustom extends ThemeExtension<CoresCustom> {
  final Color sucesso;
  final Color erro;

  const CoresCustom({
    required this.sucesso,
    required this.erro,
  });

  @override
  CoresCustom copyWith({Color? sucesso, Color? erro}) {
    return CoresCustom(
      sucesso: sucesso ?? this.sucesso,
      erro: erro ?? this.erro,
    );
  }

  @override
  CoresCustom lerp(ThemeExtension<CoresCustom>? other, double t) {
    if (other is! CoresCustom) return this;
    return CoresCustom(
      sucesso: Color.lerp(sucesso, other.sucesso, t)!,
      erro: Color.lerp(erro, other.erro, t)!,
    );
  }
}