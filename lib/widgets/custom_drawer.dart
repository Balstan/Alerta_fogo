import 'package:flutter/material.dart';

class GavetaPersonalizada extends StatelessWidget {
  final Function(int) onItemSelected;

  const GavetaPersonalizada({Key? key, required this.onItemSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Text(
              'Alerta Fogo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Início'),
            onTap: () => onItemSelected(0),
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Mapa'),
            onTap: () => onItemSelected(1),
          ),
          ListTile(
            leading: Icon(Icons.checklist),
            title: Text('Checklist'),
            onTap: () => onItemSelected(2),
          ),
          ListTile(
            leading: Icon(Icons.report),
            title: Text('Reportar'),
            onTap: () => onItemSelected(3),
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
            onTap: () => onItemSelected(4),
          ),
        ],
      ),
    );
  }
}
