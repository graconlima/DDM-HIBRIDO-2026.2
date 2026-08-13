import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//para esse exemplo, considerar o projeto graconlima/biblioteca branch aut_jwt
class ArmazenadorSeguro {
  // Inicializa o armazenamento seguro
  final _armazenador = const FlutterSecureStorage();

  // 1. Gravar dados
  Future<void> salvarDados(String token) async {
    await _armazenador.write(key: 'dados', value: token);
  }

  // 2. Ler dados
  Future<String?> obterDados() async {
    return await _armazenador.read(key: 'dados');
  }

  // 3. Deletar um dado específico
  Future<void> deletarDado() async {
    await _armazenador.delete(key: 'dados');
  }

  // 4. Limpar tudo
  Future<void> limparTudo() async {
    await _armazenador.deleteAll();
  }
}

//Exemplo 1 - salvando dados
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  ArmazenadorSeguro as = ArmazenadorSeguro();

  //gravando no armazenamento
  await as.salvarDados("nome: Aluno 1, idade: 27, aprovado: true");
  as.obterDados();
}

//Exemplo 2 - Acesso com HTTP (exemplo biblioteca_dsc em localhost)
/*class Autenticador {
  ArmazenadorSeguro as = ArmazenadorSeguro();
  String? baseUrl;

  Autenticador({required this.baseUrl});

  // Realiza o login e salva o token JWT
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/token/"),
      body: {"username": email, "password": password},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print("Token gerado: ${data['access']}");

      final String token = data['access']; // Supondo que a API retorne {"token": "..."}

      // Salva o token de forma segura
      await as.salvarDados(token);
      return true;
    }
    return false;
  }
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final as = ArmazenadorSeguro();

  final String baseUrl = "http://57.154.210.210:8000/api";//IP Azure
  //final String baseUrl = "http://10.25.2.91:8000/api";//IP Local
  final a = Autenticador(baseUrl: baseUrl);

  if(await a.login("gracon", "123")){
    final token = await as.obterDados();

    if (token != null) {
      final resposta = await http.get(
        Uri.parse("$baseUrl/livros/"),
        headers: {
          "Authorization": "Bearer $token", // Formato padrão Bearer Token
        },
      );

      print("Resposta: $resposta, corpo: ${resposta.body}");
    }else{
      print("Token nulo!");
    }
  }

}*/

//Exemplo 3 - Acesso com HTTPS (exemplo biblioteca_dsc em domínio)
/*class Autenticador {
  ArmazenadorSeguro as = ArmazenadorSeguro();
  String baseUrl;

  Autenticador({required this.baseUrl});

  Future<bool> login(String email, String password) async {
    //Passo 1: iniciar a conexao https com o objeto Uri
    final url = Uri.https(baseUrl, '/api/token/');

    final response = await http.post(
      url,
      body: {"username": email, "password": password},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Token gerado: ${data['access']}");

      final String token = data['access'];
      await as.salvarDados(token);
      return true;
    }

    print("Erro no login: ${response.statusCode} - ${response.body}");
    return false;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final as = ArmazenadorSeguro();
  //APENAS o domínio, sem 'http://', 'https://' ou '/api'
  final String baseUrl = "biblioteca.serveblog.net";

  final a = Autenticador(baseUrl: baseUrl);

  if (await a.login("gracon", "123")) {
    final token = await as.obterDados();

    if (token != null) {
      //Passo 2: Alterado para Uri.https para manter a consistência do protocolo seguro
      final urlLivros = Uri.https(baseUrl, '/api/livros/');

      final resposta = await http.get(
        urlLivros,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      print("Status Resposta: ${resposta.statusCode}");
      print("Corpo: ${resposta.body}");
    } else {
      print("Token nulo!");
    }
  }
}*/
