import 'package:flutter/material.dart';

class TelaRelatorio extends StatefulWidget {
  const TelaRelatorio({Key? key}) : super(key: key);

  @override
  _TelaRelatorioState createState() => _TelaRelatorioState();
}

class _TelaRelatorioState extends State<TelaRelatorio> {
  final _formKey = GlobalKey<FormState>();
  String _tipoIncidente = 'Incêndio Florestal';
  int _nivelGravidade = 1;
  bool _temFeridos = false;
  final _descricaoController = TextEditingController();
  final _localController = TextEditingController();

  final List<String> _tiposIncidente = [
    'Incêndio Florestal',
    'Incêndio Residencial',
    'Incêndio Industrial',
    'Queimada Controlada',
    'Outro',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reportar Incidente'),
        backgroundColor: Colors.red[700],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informações do Incidente',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Tipo de Incidente',
                          border: OutlineInputBorder(),
                        ),
                        value: _tipoIncidente,
                        items: _tiposIncidente.map((String tipo) {
                          return DropdownMenuItem(
                            value: tipo,
                            child: Text(tipo),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _tipoIncidente = value ?? 'Incêndio Florestal';
                          });
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _localController,
                        decoration: InputDecoration(
                          labelText: 'Localização',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.location_on),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, informe a localização';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detalhes Adicionais',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text('Nível de Gravidade'),
                      Slider(
                        value: _nivelGravidade.toDouble(),
                        min: 1,
                        max: 5,
                        divisions: 4,
                        label: _getNivelGravidadeLabel(),
                        activeColor: _getGravidadeColor(),
                        onChanged: (double value) {
                          setState(() {
                            _nivelGravidade = value.round();
                          });
                        },
                      ),
                      SwitchListTile(
                        title: Text('Há pessoas feridas?'),
                        value: _temFeridos,
                        activeColor: Colors.red[700],
                        onChanged: (bool value) {
                          setState(() {
                            _temFeridos = value;
                          });
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _descricaoController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Descrição',
                          border: OutlineInputBorder(),
                          hintText: 'Descreva o incidente com detalhes...',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, forneça uma descrição';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _enviarRelatorio,
                icon: Icon(Icons.send),
                label: Text('Enviar Relatório'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getNivelGravidadeLabel() {
    switch (_nivelGravidade) {
      case 1:
        return 'Baixo';
      case 2:
        return 'Moderado';
      case 3:
        return 'Significativo';
      case 4:
        return 'Alto';
      case 5:
        return 'Crítico';
      default:
        return 'Desconhecido';
    }
  }

  Color _getGravidadeColor() {
    switch (_nivelGravidade) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.orange;
      case 4:
        return Colors.deepOrange;
      case 5:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _enviarRelatorio() {
    if (_formKey.currentState!.validate()) {
      // Aqui você implementaria a lógica para enviar o relatório
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Relatório enviado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
      
      // Limpar o formulário
      _descricaoController.clear();
      _localController.clear();
      setState(() {
        _nivelGravidade = 1;
        _temFeridos = false;
        _tipoIncidente = 'Incêndio Florestal';
      });
    }
  }

  @override
  void dispose() {
    _descricaoController.dispose();
    _localController.dispose();
    super.dispose();
  }
}
