import 'package:bloc/bloc.dart';
import 'evento.dart';

class AtualizadorTextoBloc extends Bloc<IMCEvento, String>{
  String textoIMC = "";

  AtualizadorTextoBloc() : super("");

  @override
  Stream<String> mapEventToState(IMCEvento evento) async* {
    double a = evento.a, p = evento.p, imc = p/(a*a);
    textoIMC = "O IMC e $imc";
    yield textoIMC;
  }
}
