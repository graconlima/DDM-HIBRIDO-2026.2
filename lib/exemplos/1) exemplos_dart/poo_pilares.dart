import 'poo.dart';

void main() {
  //Exemplo Encapsulamento com  POO 1
  /*Pessoa p = Pessoa();
  p._nome = "Joao";*/

  //Exemplo: sobrecarga
  /*Calculadora c = Calculadora();
  print(c.somar(7, 3));*/

  //Exemplo: Mixin
  Pato p = Pato();
  p.nadar();
}

mixin Caminhante {
  void caminhar() => print("Caminhando...");
}

mixin Nadador {
  void nadar() => print("Nadando...");
}

class Pato with Caminhante, Nadador {}

/*Exemplo de sobrecarga:
  int somar()
  int somar(int a, int b)
  int somar(double a, double b); */
/*class Calculadora {
  int somar(int a, [int b = 0]) => a + b;
}*/