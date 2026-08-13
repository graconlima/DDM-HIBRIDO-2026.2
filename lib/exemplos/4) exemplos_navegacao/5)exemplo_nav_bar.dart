import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ValueNotifier<int> _indicePai = ValueNotifier<int>(0);

  final List<Widget> _telas = const [
    Center(child: Text('Início')),
    Center(child: Text('Configurações')),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ValueListenableBuilder<int>(
        valueListenable: _indicePai,
        builder: (context, valorAtual, child) {
          return Scaffold(
            appBar: AppBar(title: const Text('Stateless Nav')),

            // Corpo muda conforme o valor do ValueNotifier
            body: _telas[valorAtual],

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: valorAtual,
              onTap: (novoIndice) => _indicePai.value = novoIndice,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ajustes'),
              ],
            ),
          );
        },
      ),
    );
  }
}
