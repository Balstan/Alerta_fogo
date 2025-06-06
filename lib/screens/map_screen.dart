import 'package:flutter/material.dart';

class TelaMapa extends StatelessWidget {
  const TelaMapa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa de Incêndios'),
        backgroundColor: Colors.red[700],
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Área do mapa (simulada)
          Container(
            color: Colors.grey[200],
            child: Center(
              child: Icon(
                Icons.map,
                size: 100,
                color: Colors.grey[400],
              ),
            ),
          ),
          // Overlay com informações
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alertas Ativos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildAlertItem(
                      'Incêndio Florestal',
                      'Serra do Mar - 5km',
                      Icons.warning,
                      Colors.red,
                    ),
                    _buildAlertItem(
                      'Risco Moderado',
                      'Vale do Paraíba - 12km',
                      Icons.info,
                      Colors.orange,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Botões de controle
          Positioned(
            bottom: 16,
            right: 16,
            child: Column(
              children: [
                _buildMapButton(Icons.my_location, 'Minha Localização'),
                SizedBox(height: 8),
                _buildMapButton(Icons.layers, 'Camadas'),
                SizedBox(height: 8),
                _buildMapButton(Icons.info, 'Informações'),
              ],
            ),
          ),
          // Legenda
          Positioned(
            bottom: 16,
            left: 16,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Legenda',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    _buildLegendItem(Colors.red, 'Alto Risco'),
                    _buildLegendItem(Colors.orange, 'Médio Risco'),
                    _buildLegendItem(Colors.yellow, 'Baixo Risco'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertItem(String title, String subtitle, IconData icon, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMapButton(IconData icon, String tooltip) {
    return FloatingActionButton(
      mini: true,
      backgroundColor: Colors.white,
      onPressed: () {},
      tooltip: tooltip,
      child: Icon(icon, color: Colors.black87),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(width: 4),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
