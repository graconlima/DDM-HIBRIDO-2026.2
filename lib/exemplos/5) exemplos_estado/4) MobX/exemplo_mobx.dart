import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

// Nome do arquivo gerado pelo build_runner (comando: dart run build_runner build --delete-conflicting-outputs)
part 'exemplo_mobx.g.dart';

class CounterStore = CounterStoreBase with _$CounterStore;

abstract class CounterStoreBase with Store {
  @observable
  int value = 0;

  @action
  void incremento() {
    value++;
  }

  @action
  void decremento() {
    value--;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  // Instancia a store
  final CounterStore store = CounterStore();

  CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo MobX Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Você apertou o botão tantas vezes:'),
            // O Observer reconstrói apenas este trecho quando 'store.value' muda
            Observer(
              builder: (_) => Text(
                '${store.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.incremento,
        child: const Icon(Icons.add),
      ),
    );
  }
}
