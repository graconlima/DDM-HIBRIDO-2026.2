import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import '../modelos/notificacao.dart';
import '../local/notificacao_local.dart';

class NotificacaoRemota{

  NotificacaoLocal nl = NotificacaoLocal();
  FirebaseMessaging fm = FirebaseMessaging.instance;

  NotificacaoRemota(){
    inicializar();
  }

  inicializar() async {
    await fm.requestPermission();//iOS
    String? token = await fm.getToken();//o token gerado deve ser enviado aos backends para enviar notificacoes
    print("Token: $token");

    //Exemplo envio ao Backend
    await http.post(
      Uri.parse(
        "https://biblioteca.serveblog.net/api/firebase/tokens/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"usuario": "gracon","token": token})
      );

    //app em foreground
    FirebaseMessaging.onMessage.listen((m){
      nl.notificar(Notificacao(id: m.notification!.android.hashCode, titulo: m.notification?.title, body: m.notification?.body, payload: m.data['dado_extra']));
      print("Nova mensagem!");
    });

    //app em background
    FirebaseMessaging.onMessageOpenedApp.listen((m){
      print("Notificacao aberta!");
    });
  }
}
