
import 'package:flutter_mobx/flutter_mobx.dart';

import '../funcionalidades/config/mudar_tema.dart';
import '../funcionalidades/config/pagina_config.dart';

import '../core/temas/controlador_tema.dart';
import '../core/temas/fabrica_temas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controlador = context.read<ControladorTema>();

    //Com MobX
    return Observer(
      builder: (_) {
        return MaterialApp(
          theme: FabricaTemas.light(controlador.themeType),
          darkTheme: FabricaTemas.dark(controlador.themeType),
          themeMode: controlador.themeMode,
          home: PaginaConfig(),
        );
      },
    );

    /* //Com Provider
    return MaterialApp(
      theme: FabricaTemas.light(controlador.themeType),
      darkTheme: FabricaTemas.dark(controlador.themeType),
      themeMode: controlador.themeMode,
      home: PaginaConfig(),
    );*/
  }
}