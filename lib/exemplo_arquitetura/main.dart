import 'app/app.dart';
import 'core/temas/controlador_tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //MobX
  runApp(
    Provider<ControladorTema>(
      create: (_) => ControladorTema(),
      child: MeuApp(),
    ),
  );

  /*//Provider

  final controlador = ControladorTema();
  await controlador.load();
  runApp(
    ChangeNotifierProvider(
      create: (_) => controlador,
      child: const MeuApp(),
    ),
  );*/
}