import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../modelos/notificacao.dart';

class NotificacaoLocal{

  FlutterLocalNotificationsPlugin notificador = FlutterLocalNotificationsPlugin();

  NotificacaoLocal(){
    inicializar();
  }

  inicializar() async {
    //obrigatório um icone
    await notificador.initialize(
        settings: InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher')
        )
    );
    await notificador.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  notificar(Notificacao n) async {

    print("Nota: id: ${n.id}, titulo: ${n.titulo}, body: ${n.body}, payload: ${n.payload}");

    AndroidNotificationDetails detalhes_notificacao_android = AndroidNotificationDetails(
      "id_canal",
      "Notificacao Geral",
      channelDescription: "Canal para notificacao",
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true
    );

    await notificador.show(
      id: n.id,
      title: n.titulo,
      body: n.body,
      payload: n.payload,
      notificationDetails: NotificationDetails(android: detalhes_notificacao_android)
    );
  }
}