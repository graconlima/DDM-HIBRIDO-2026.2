void main(){

//Exemplo 1 - variaveis
/*var dolar = 185, real  = 5.22;
var resultado = dolar * real;
print("O valor de \$ $dolar em reais e: $resultado");*/

//Exemplo 2 - condicional simples
/*var numero = 11;
if( (numero >= 1) || (numero <= 10) ){

 print("Valor dentro do intervalo 1 e 10");
}*/

//Exemplo 3 - condicional composta

/*var numero = 11;
if((numero >= 1) && (numero <=10) )
//teste verdadeiro
{
 print("Valor dentro do intervalo");
}
else
//teste falso
{
 print("Valor fora do intervalo");
}*/

//Exemplo 4 - Lacos
//4.1 - laco wihle

/*var contador = 10;

while(contador >= 0){
 print(contador);
 contador --;
}*/

//4.2 - laco for
/*for(var contador  = 0 ; contador <= 10 ; contador++){
 print("Valor do contador $contador");
}*/

//4.3 - laco do...while
/*var contador = 0;

do{
 print(contador);
 contador++;
}while(contador <= 10);*/

//Exemplo 4: Registros
/*  (int, int) registro = (10, 7);
  print(registro.$1);
  print(registro.$2);

  var (a, b) = (10, 7);
  print(a);
  print(b);

  ({String nome, int idade}) pessoa = (nome: 'Lucas', idade: 22);
  print(pessoa.nome);
  print(pessoa.idade);*/

//Exemplo 5 - Funcoes
//print(soma(3,4));
//anonima e lambda: (a, b) => print(a+b);
print (somar(7, 7));

//closure:
/*var r = mult(7);
print(r(7));*/

/*  var s = saudacao("Ola");
  print(s("Gracon"));*/

//Exemplo 6: Listas
/*  var numeros = [1, 2, 3, 4, 5, 6];
  print(numeros[0]); // 1
  var pares = numeros.where((n) => n.isEven).toList();
  print(pares);*/

//Exemplo 7: Set
  /*var conjunto = {1, 2, 2, 3};
  print(conjunto); // {1, 2, 3}*/

//Exemplo 8: Mapa
/*  var capital = {'Brasil': 'Brasília', 'França': 'Paris'};
  print(capital['Brasil']); // Brasília*/

//Exemplo 9: Null Safety
/*String? nome;
print(nome);*/

//Exemplo 10: dynamic x var
/*dynamic v = "Nome";
print(v);

v = 10 + 1;
print(v);*/

}

/*int soma(int a, int b){

  return a+b;
}*/

//anonima
//var somar = (int a, int b){return a + b;};

//lambda
var somar = (int a, int b) => a + b;

//closure (a)
/*Function mult(int a) {
  return (int b) {
    print(a * b);
  };
}*/

//closure (b)
/*Function saudacao(String prefixo) {
  return (String nome) {
    print('$prefixo, $nome');
  };
}*/
