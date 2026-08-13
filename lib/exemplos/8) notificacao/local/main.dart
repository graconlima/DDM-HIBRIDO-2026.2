import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modelos/notificacao.dart';
import '../local/notificacao_local.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [Provider<NotificacaoLocal>(create: (c) => NotificacaoLocal())],
      child: MinhaAplicacao()
    )
  );
}

class MinhaAplicacao extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MinhaHomePage());
  }
}

class MinhaHomePage extends StatefulWidget{
  MinhaHomePageEstado createState() => MinhaHomePageEstado();
}

class MinhaHomePageEstado extends State<MinhaHomePage>{
  int contador = 0;

  void incrementoContador(){
    setState(() {
      contador++;
      Provider.of<NotificacaoLocal>(context, listen: false).notificar(
        Notificacao(
          id: 1,
          titulo: "Notificacao $contador",
          body: "Contagem: $contador",
          payload: "/rota_app")
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child:Text("$contador")),
      floatingActionButton: FloatingActionButton(onPressed: incrementoContador),
    );
  }
}