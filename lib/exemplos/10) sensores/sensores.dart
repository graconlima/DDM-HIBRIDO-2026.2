
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:light/light.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:proximity_sensor/proximity_sensor.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:environment_sensors/environment_sensors.dart';
import 'package:local_auth/local_auth.dart';

class Sensores{

  void gps() async {
    var ativo = await Geolocator.requestPermission();
    if(ativo == LocationPermission.denied) {
      return Future.error("Permissao negada!");
    }

    var p = await Geolocator.getCurrentPosition();
    print("Dados do GPS - lat: ${p.latitude}, lon: ${p.longitude}, vel: ${p.speed}");
  }

  void bussola(){
    //Magnetometro
    magnetometerEventStream().listen((MagnetometerEvent me) => print("Posicao - X: ${me.x}, Y: ${me.y}, Z: ${me.z}"));
  }

  void pressao_atmosferica(){
    //Barometro
    barometerEventStream().listen((BarometerEvent be) => print("Pressao - ${be.pressure}"));
  }

  void aceleracao(){
    userAccelerometerEventStream().listen((UserAccelerometerEvent ae) => print("Aceleracao - X: ${ae.x}, Y: ${ae.y}, Z: ${ae.z}"));
  }

  void giroscopio(){
    gyroscopeEventStream().listen((GyroscopeEvent ge) => print("Giroscopio - X: ${ge.x}, Y: ${ge.y}, Z: ${ge.z}"));
  }

  void luminosidade(){
    Light l = Light();
    l.lightSensorStream.listen((int li) => print("Intensidade da luz: $li"));
  }

  void proximidade(){
    ProximitySensor.events.listen((int p) => print("Proximidade: $p") );
  }

  void pedometro() async {
    PermissionStatus ps = await Permission.activityRecognition.request();

    if(ps.isGranted){
      Pedometer.stepCountStream.listen((StepCount se) => print("Contagem: ${se.steps}"));
    }else{
      print("Pedometro negado.");
    }
  }

  void ambiente(){
    //Esse pacote parece ter sido descontinuado
    //EnvironmentSensors es = EnvironmentSensors();
    //es.temperature.listen((t) => print("Temperatura: $t"));
    //es.humidity.listen((h) => print("Humidade: $h") );
  }

  void impressao_digital() async {
    LocalAuthentication la = LocalAuthentication();
    if(await la.canCheckBiometrics){
      la.authenticate(
          localizedReason: "Autentique-se!",
          biometricOnly: true
      );
    }
  }
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Sensores s = Sensores();
  //s.gps();
  //s.bussola();
  //s.pressao_atmosferica();
  //s.aceleracao();
  //s.giroscopio();
  //s.luminosidade();
  //s.proximidade();
  //s.pedometro();
  //s.impressao_digital();
}