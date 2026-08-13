class Notificacao{
  int id;
  String? titulo;
  String? body;
  String? payload;//pode ser modificado para varios objetos

  Notificacao({
    required this.id,
    required this.titulo,
    required this.body,
    required this.payload
  });
}