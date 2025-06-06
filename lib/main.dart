import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/map_screen.dart';
import 'screens/checklist_screen.dart';
import 'screens/report_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(AlertaFogoApp());
}

class AlertaFogoApp extends StatelessWidget {
  const AlertaFogoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alerta Fogo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.red[700],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[700],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.red[700]!),
          ),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => TelaInicial(),
        '/login': (context) => TelaLogin(),
        '/home': (context) => TelaInicial(),
        '/map': (context) => TelaMapa(),
        '/checklist': (context) => TelaChecklist(),
        '/report': (context) => TelaRelatorio(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

// Drawer personalizado que será usado em todas as telas após o login
class DrawerPrincipal extends StatelessWidget {
  const DrawerPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red[700],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.red[700]!,
                  Colors.red[900]!,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.local_fire_department,
                  color: Colors.white,
                  size: 48,
                ),
                SizedBox(height: 8),
                Text(
                  'Alerta Fogo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sistema de Prevenção',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Página Inicial'),
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Mapa de Incêndios'),
            onTap: () => Navigator.pushNamed(context, '/map'),
          ),
          ListTile(
            leading: Icon(Icons.checklist),
            title: Text('Checklist de Segurança'),
            onTap: () => Navigator.pushNamed(context, '/checklist'),
          ),
          ListTile(
            leading: Icon(Icons.warning),
            title: Text('Reportar Incidente'),
            onTap: () => Navigator.pushNamed(context, '/report'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            onTap: () {
              // Implementar configurações
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
    );
  }
}
