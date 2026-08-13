import 'package:flutter/material.dart';
import '../config/mudar_tema.dart';

class PaginaConfig extends StatelessWidget {
  const PaginaConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      drawer: MudarTema(),
      body: const Padding(
        padding: EdgeInsets.all(16),

      ),
    );
  }
}