import 'package:encrypt/encrypt.dart' as encrypt;

// Exemplo de 4) criptografia AES
class Encriptador{
  final chave = encrypt.Key.fromLength(32); // Chave de 32 bytes
  final vi = encrypt.IV.fromLength(16);  // Vetor de Inicialização
  late final encrypt.Encrypter e;

  Encriptador(){
    e = encrypt.Encrypter(encrypt.AES(chave));
  }

  String cifrar(String t){
    final textoCifrado = e.encrypt(t, iv: vi);
    print("Texto cifrado: ${textoCifrado.base64}");
    return textoCifrado.base64;
  }

  String decifrar(String t){
    final textoDecifrado = e.decrypt64(t, iv: vi);
    print("Texto decifrado: ${textoDecifrado}");
    return textoDecifrado;
  }
}

void main(){
  Encriptador e = Encriptador();
  final tc = e.cifrar("Aula de DSD");
  final td = e.decifrar(tc);
}
