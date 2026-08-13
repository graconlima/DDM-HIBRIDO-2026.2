import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArmazenamentoInseguro {
  final sp = SharedPreferencesAsync();

  Future<void> salvarDados(String c, Object v) async {
    return switch(v){
      String _ => await sp.setString(c, v),
      int _ => await sp.setInt(c, v),
      bool _ => await sp.setBool(c, v),
      double _ => await sp.setDouble(c, v),
      _ => throw Exception("Tipo nao suportado pelo SharedPreferences")
    };
  }

  Future<void> lerDados() async {
    final l = await sp.getAll();
    l.forEach((c, v) {
      print("$c: $v");
    });
  }

  Future<void> removerDado(String s) async {
    await sp.remove(s);
  }

  Future<void> limparTudo() async {
    await sp.clear();
  }
}

//Teste: Chrome (F12 - Application)
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  ArmazenamentoInseguro ai = ArmazenamentoInseguro();

  //gravando no armazenamento
  await ai.salvarDados("nome", "Aluno 1");
  await ai.salvarDados("idade", 27);
  await ai.salvarDados("aprovado", true);

  ai.lerDados();
}