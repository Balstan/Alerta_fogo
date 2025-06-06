import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class TelaMapa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa de Incêndios'),
        backgroundColor: Colors.red[700],
        elevation: 0,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(-23.55052, -46.633308), // São Paulo coordinates as example
          zoom: 10.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.alerta_fogo_new',
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(-23.55052, -46.633308),
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.warning,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}