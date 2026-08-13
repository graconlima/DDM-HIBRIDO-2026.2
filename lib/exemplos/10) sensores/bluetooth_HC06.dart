import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_classic_serial/flutter_bluetooth_classic.dart';


class GerenciadorBluetooth{
  FlutterBluetoothClassic b = FlutterBluetoothClassic();
  List<BluetoothDevice> lb = [];

  Future<bool> iniciar() async {
    if(await b.isBluetoothSupported() && await b.isBluetoothEnabled()){
      //lb = await b.getDiscoveredDevices();//tratar novos dispositivos
      lb = await b.getPairedDevices();//para simplificar, vamos listar ja pareados
      if(lb != null){
        lb?.forEach((e) => print("Endereco: ${e.address}"));
      }
      return true;
    }else{
      print("BT indisponivel");
      return false;
    }
  }

  Future<bool> conectar(String e) async {
    print("Conectando ao BT...");
    return (await b.connect(e)) ? true : false;
  }

  void ler(){
    print("Lendo dados do BT em background...");
    b.onDataReceived.listen((BluetoothData bd) => print("Dado do bt: ${bd.asString()}"));
  }

  void escrever(String d) async{
    print("Enviando dado...");
    (await b.sendString(d))? print("Dado enviado.") : print ("Nao enviado!") ;
  }

  void desconectar() async{
    print("Desconectando...");
    (await b.disconnect()) ? print("Desconectado!") : print("Falha na desconexao!");
    await Future.delayed(Duration(seconds: 3));//espera estabilizar
  }
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  GerenciadorBluetooth gb = GerenciadorBluetooth();
  if(await gb.iniciar()){
    print("Iniciado com sucesso...");
    if(await gb.conectar("98:DA:60:0A:B0:52")){
      print("Conectado com sucesso!");
      gb.ler();

      for(int i = 0; i < 10;i++){
        print("Enviando...");
        await Future.delayed(Duration(seconds: 3));
        gb.escrever("Ola BT");
      }

      gb.desconectar();

    }else{
      print("Desconectado");
    }
  }else{
    print("Nao iniciado");
  }
}

//Exemplo: Sketch (Arduino Uno, TX: pino 10, RX: pino 11)
/*#include <SoftwareSerial.h>
SoftwareSerial b(10, 11);

void setup() {
 Serial.begin(9600);
 b.begin(9600);
 Serial.println("BT iniciado. Aguardando dados do Flutter...");
}

void loop() {
 if (b.available() > 0) {
  Serial.print("Do bluetooth: ");
  while (b.available() > 0) {
   char c = b.read();
   Serial.print(c);
   delay(2);
  }

  b.print("Recebido");
  Serial.println();
 }
}*/