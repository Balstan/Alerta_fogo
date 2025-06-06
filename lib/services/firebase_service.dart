// Serviço para configurar notificações push com Firebase Messaging
import 'package:firebase_messaging/firebase_messaging.dart';


class ServicoFirebase {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;


  Future<void> inicializar() async {
    // Solicitar permissões para iOS
    await _firebaseMessaging.requestPermission();

    // Obter token do dispositivo
    String? token = await _firebaseMessaging.getToken();
    print('Token do Firebase Messaging: $token');

    // Escutar mensagens recebidas
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Mensagem recebida no foreground: ${message.notification?.title}');
      // Aqui pode-se mostrar notificação local
    });
  }
}
