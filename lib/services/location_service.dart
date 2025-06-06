// Serviço para gerenciar localização e geofencing
import 'package:geolocator/geolocator.dart';

class ServicoLocalizacao {
  Future<Position?> obterPosicaoAtual() async {
    bool servicoAtivo = await Geolocator.isLocationServiceEnabled();
    if (!servicoAtivo) {
      print('Serviço de localização desativado.');
      return null;
    }

    LocationPermission permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        print('Permissão de localização negada.');
        return null;
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      print('Permissão de localização negada permanentemente.');
      return null;
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
