import 'package:flutter/material.dart';

class CartaoAlerta extends StatelessWidget {
  final String titulo;
  final String descricao;
  final DateTime data;

  const CartaoAlerta({
    Key? key,
    required this.titulo,
    required this.descricao,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(titulo, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(descricao),
        trailing: Text(
          '${data.day}/${data.month}/${data.year}',
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
      ),
    );
  }
}
