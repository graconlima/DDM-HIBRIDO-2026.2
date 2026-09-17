import 'package:flutter/material.dart';

//Exemplo 1: clique simples
/*main(){
  runApp(Container(
      color: Color(0xFF00FF00) ,
      child: GestureDetector(onTap: (){print("Clicado");})
  ));
}*/

//Exemplo 2: clique simples (com filho)
/*void main(){
  runApp(MinhaApp());
}

class MinhaApp extends StatelessWidget{
  Widget build(BuildContext bc){
    return MaterialApp(
        title: "Ola Mundo!",
        home: Scaffold(
            appBar: AppBar(title: Text("Ola")),
            body: Center(child: GestureDetector(onTap: (){print("Clicado!");}, child: Text("Ola Mundo", style: TextStyle(backgroundColor: Colors.blue))))
        )
    );
  }
}*/

//Exemplo 3: clique duplo
/*main(){
  runApp(Container(
      color: Color(0xFF00FF00) ,
      child: GestureDetector(onDoubleTap: (){print("Clique duplo");})
  ));
}*/

//Exemplo 3.1: clique duplo e simples
/*main(){
  runApp(Container(
      color: Color(0xFF00FF00) ,
      child: GestureDetector(
        onTap: (){print("Clique simples");},
        onDoubleTap: (){print("Clique duplo");}
      )
  ));
}*/


//Exemplo 4: arrastar e soltar
/*main(){
  runApp(Container(
      color: Color(0xFF00FF00) ,
      child: GestureDetector(
        onHorizontalDragStart: (DragStartDetails d){
          print("Inicio arrasto horizontal");
          print(d);
        },
        onVerticalDragEnd: (DragEndDetails d){
          print("Fim arrasto vertical");
          print(d);
        },
      )
  ));
}*/

//Exemplo 5 - Clique simples com Alerta
/*void main(){
  runApp(MaterialApp(home: MinhaApp()));
}

class MinhaApp extends StatelessWidget{
  Widget build(BuildContext bc){
    return Scaffold(
        appBar: AppBar(title: Text("Ola")),
        body: Center(child: GestureDetector(onTap: (){exibirInformacao(bc, "clicado!");}, child: Text("Ola Mundo")))
    );
  }

  void exibirInformacao(BuildContext bc, String informacao){
    var alerta = AlertDialog(title: Text("Informacao"), content: Text(informacao));
    showDialog(context: bc, builder: (bc){return alerta;});
  }
}*/

//Exemplo 6: deslizar com dois alertas, clique secundário e terciário, e detalhes
/*void main(){
  runApp(MaterialApp(home: MinhaApp()));
}

class MinhaApp extends StatelessWidget{
  Widget build(BuildContext bc){
    return Scaffold(
        appBar: AppBar(title: Text("Ola")),
        body: Center(child: GestureDetector(
          onSecondaryTap: () {
           print("clique segundo bt!");
          },
          onTertiaryTapDown: (TapDownDetails tdd) {
            print("clique bt central");
          },
          onHorizontalDragStart: (DragStartDetails dsd){
            var s = "${dsd.globalPosition}, "
                "${dsd.kind}, "
                "${dsd.localPosition}, "
                "${dsd.sourceTimeStamp}, "
                "${dsd.hashCode}, "
                "${dsd.runtimeType}";
            exibirInformacao(bc, "Posicao de inicio de arrasto horizontal: "+s);
          },
          onHorizontalDragEnd: (DragEndDetails ded){
            var s = "${ded.primaryVelocity}, "
                "${ded.velocity}, "
                "${ded.runtimeType}, "
                "${ded.hashCode}";
            exibirInformacao(bc, "Posicao de fim de arrasto horizontal: "+s);
          },
          onVerticalDragStart: (DragStartDetails dsd){
            var s = "${dsd.globalPosition}, "
                "${dsd.kind}, "
                "${dsd.localPosition}, "
                "${dsd.sourceTimeStamp}, "
                "${dsd.hashCode}, "
                "${dsd.runtimeType}";
            exibirInformacao(bc, "Posicao de inicio de arrasto vertical: "+s);
          },
          onVerticalDragEnd: (DragEndDetails ded){
            var s = "${ded.primaryVelocity}, "
                "${ded.velocity}, "
                "${ded.runtimeType}, "
                "${ded.hashCode}";
            exibirInformacao(bc, "Posicao de fim de arrasto vertical: $s");
          },
          child: Text("Ola Mundo")))
    );
  }

  void exibirInformacao(BuildContext bc, String informacao){
    var alerta = AlertDialog(title: Text("Informacao"), content: Text(informacao));
    showDialog(context: bc, builder: (bc){return alerta;});
  }
}*/


//Exemplos extras: caso da lâmpada
/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AulaGestureDetector(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AulaGestureDetector extends StatelessWidget {
  const AulaGestureDetector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aula: GestureDetector'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // O GestureDetector age como um "sensor invisível" ao redor do Container
            GestureDetector(
              behavior: HitTestBehavior.opaque,

              onTap: () {
                print('💡 [Terminal]: Toque simples detectado!');
              },
              onDoubleTap: () {
                print('✨ [Terminal]: Toque duplo detectado!');
              },
              onLongPress: () {
                print('💥 [Terminal]: Toque longo detectado!');
              },

              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.touch_app,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Interaja com o quadrado azul acima\ne abra o Console/Terminal do seu editor!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}*/

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExemploGestureDetectorStateless(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// 1. Toda a tela agora é um StatelessWidget!
class ExemploGestureDetectorStateless extends StatelessWidget {
  const ExemploGestureDetectorStateless({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Criamos uma "caixinha" que guarda e avisa quando o estado da lâmpada muda
    final ValueNotifier<EstadoLampada> estadoDaLampada = ValueNotifier(
      EstadoLampada(
        estaLigada: false,
        cor: Colors.grey,
        mensagem: "Interaja com a lâmpada!",
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless: GestureDetector'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        // 3. O ValueListenableBuilder reconstrói APENAS o que está dentro dele quando o estado muda
        child: ValueListenableBuilder<EstadoLampada>(
          valueListenable: estadoDaLampada,
          builder: (context, estado, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,

                  // 1 Toque: Liga e desliga
                  onTap: () {
                    final novaLigada = !estado.estaLigada;
                    estadoDaLampada.value = EstadoLampada(
                      estaLigada: novaLigada,
                      cor: novaLigada ? Colors.amber : Colors.grey,
                      mensagem: novaLigada ? "Você LIGOU a lâmpada!" : "Você DESLIGOU a lâmpada!",
                    );
                  },

                  // 2 Toques: Modo Festa
                  onDoubleTap: () {
                    estadoDaLampada.value = EstadoLampada(
                      estaLigada: true,
                      cor: Colors.purple,
                      mensagem: "Modo Festa Ativado! (Toque duplo)",
                    );
                  },

                  // Segurar: Queima a lâmpada
                  onLongPress: () {
                    estadoDaLampada.value = EstadoLampada(
                      estaLigada: false,
                      cor: Colors.black,
                      mensagem: "Ops! Você segurou demais e a lâmpada queimou!",
                    );
                  },

                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: estado.cor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        if (estado.estaLigada)
                          BoxShadow(
                            color: estado.cor.withOpacity(0.5),
                            blurRadius: 30,
                            spreadRadius: 10,
                          )
                      ],
                    ),
                    child: const Icon(
                      Icons.lightbulb_outline,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Texto explicativo da mensagem dinâmica
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    estado.mensagem,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "💡 1 Toque: Liga/Desliga\n✨ 2 Toques: Modo Festa\n💥 Segurar: Queima a lâmpada",
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

// 4. Uma classe simples para agrupar as variáveis que mudam juntas
class EstadoLampada {
  final bool estaLigada;
  final Color cor;
  final String mensagem;

  EstadoLampada({
    required this.estaLigada,
    required this.cor,
    required this.mensagem,
  });
}*/

//Exemplo 7: zoom
/*void main(){
  runApp(MaterialApp(home: MinhaApp()));
}

class MinhaApp extends StatelessWidget{
  Widget build(BuildContext bc){
    return Scaffold(
        appBar: AppBar(title: Text("Ola")),
        body: Center(child: GestureDetector(
          onScaleUpdate: (details) {
            print('Zoom: ${details.scale}');
          },
          child: Container(
            width: 300,
            height: 300,
            color: Colors.black12,
            child: Center(
              child: Text('Use dois dedos para aplicar zoom'),
            ),
          ),
        )
      )
    );
  }

  void exibirInformacao(BuildContext bc, String informacao){
    var alerta = AlertDialog(title: Text("Informacao"), content: Text(informacao));
    showDialog(context: bc, builder: (bc){return alerta;});
  }
}*/

/*import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AulaZoomPuroGestureDetector(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AulaZoomPuroGestureDetector extends StatelessWidget {
  const AulaZoomPuroGestureDetector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zoom Puro: GestureDetector'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // O GestureDetector puro interceptando os movimentos de pinça
            GestureDetector(
              behavior: HitTestBehavior.opaque,

              // 1. Disparado quando o usuário encosta os dois dedos na tela
              onScaleStart: (ScaleStartDetails detalhes) {
                print('🏁 [Terminal]: Começou o movimento de zoom!');
              },

              // 2. Disparado continuamente enquanto o usuário afasta ou aproxima os dedos
              onScaleUpdate: (ScaleUpdateDetails detalhes) {
                // detalhes.scale nos dá o multiplicador do zoom (ex: 1.5x, 2.0x)
                print('🔍 [Terminal]: Fator de Zoom Atual: ${detalhes.scale.toStringAsFixed(2)}x');
              },

              // 3. Disparado quando o usuário retira os dedos da tela
              onScaleEnd: (ScaleEndDetails detalhes) {
                print('🛑 [Terminal]: Terminou o movimento de zoom.');
              },

              child: Container(
                width: 200,
                height: 200,
                color: Colors.orange,
                alignment: Alignment.center,
                child: const Text(
                  'Faça a Pinça Aqui\n(Zoom)',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Segure Ctrl (ou Option) no emulador e faça o gesto de pinça no quadrado laranja para ver o fator de zoom mudar no terminal!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AulaZoomStateless(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AulaZoomStateless extends StatelessWidget {
  const AulaZoomStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aula: Gesto de Zoom (Stateless)'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        // 1. O InteractiveViewer gerencia todo o gesto de pinça e arrasto automaticamente
        child: InteractiveViewer(
          clipBehavior: Clip.none, // Permite que a imagem passe das bordas ao dar zoom
          minScale: 1.0,           // Zoom mínimo permitido (tamanho original)
          maxScale: 4.0,           // Zoom máximo permitido (4x maior)

          // O widget visual que sofrerá a ação de zoom
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.teal[300],
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.zoom_in,
              size: 100,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

