
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
/*Stream<int> buscarNumeros() async*{
  for(int i = 0; i <= 7;i++) {
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

void main() async {
  await for(int n in buscarNumeros()){
    print("Numero: $n");
  }
}*/

//Exemplo 3: explorando Future com e sem await e com then
void main(){
  exemploSemAwaitComThen();
}

// Função assíncrona que retorna um Future após 2 segundos
Future<String> buscarMensagem() async {
  await Future.delayed(Duration(seconds: 2));
  return "Dados carregados com sucesso!";
}

void exemploComAwait() async {
  print("Início do processo");

  // O código PÁRA aqui por 2 segundos
  String resultado = await buscarMensagem();
  print(resultado); // Imprime: "Dados carregados com sucesso!"

  print("Fim do processo");
}

void exemploSemAwait() {
  print("Início do processo");

  // Dispara a função, mas NÃO espera os 2 segundos
  Future<String> futuroResultado = buscarMensagem();

  print("Continuando o código imediatamente...");
  print(futuroResultado); // Imprime: Instance of 'Future<String>'

  print("Fim do processo");
}

void exemploSemAwaitComThen() {
  print("1. Iniciando a requisição...");

  // 1º COISA: Você pega a INSTÂNCIA (a promessa) imediatamente sem await
  Future<String> minhaPromessa = buscarMensagem();

  // Você pode usar essa instância, passar para outras funções, etc.
  print("2. Guardei a instância: $minhaPromessa"); // Printa: Instance of 'Future<String>'

  // 2º e 3º COISA: Você define o que fazer no SUCESSO e no ERRO
  minhaPromessa.then((sucesso) {
    print("-> 4. Sucesso recebido em segundo plano: $sucesso");
  }).catchError((erro) {
    print("-> 4. Erro capturado em segundo plano: $erro");
  });

  print("3. Código principal seguiu em frente sem travar!");
}