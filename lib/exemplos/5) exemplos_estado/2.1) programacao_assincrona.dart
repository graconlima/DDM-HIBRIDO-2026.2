
//Exemplo 1: Future com async
/*Future<int> buscarNumero() async{
  await Future.delayed(Duration(seconds: 3));
  return 7;
}

void main() async {
  for(int i = 0; i <= 7;i++) {
    int n = await buscarNumero();
    print("Numero: $n");
  }
}*/

//Exemplo 2: Stream com async*
Stream<int> buscarNumeros() async*{
  for(int i = 0; i <= 7;i++) {
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

void main() async {
  await for(int n in buscarNumeros()){
    print("Numero: $n");
  }
}