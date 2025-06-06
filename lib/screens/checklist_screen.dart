import 'package:flutter/material.dart';

class TelaChecklist extends StatefulWidget {
  const TelaChecklist({Key? key}) : super(key: key);

  @override
  _TelaChecklistState createState() => _TelaChecklistState();
}

class _TelaChecklistState extends State<TelaChecklist> {
  final Map<String, List<ChecklistItem>> _categorias = {
    'Kit de Emergência': [
      ChecklistItem('Água potável (2L por pessoa)'),
      ChecklistItem('Alimentos não perecíveis'),
      ChecklistItem('Kit de primeiros socorros'),
      ChecklistItem('Lanternas e pilhas extras'),
      ChecklistItem('Rádio portátil'),
    ],
    'Documentos Importantes': [
      ChecklistItem('RG e CPF'),
      ChecklistItem('Documentos do imóvel'),
      ChecklistItem('Cartões bancários'),
      ChecklistItem('Apólices de seguro'),
      ChecklistItem('Receitas médicas'),
    ],
    'Plano de Evacuação': [
      ChecklistItem('Definir ponto de encontro'),
      ChecklistItem('Identificar rotas de fuga'),
      ChecklistItem('Manter tanque do carro cheio'),
      ChecklistItem('Lista de contatos de emergência'),
      ChecklistItem('Plano para animais de estimação'),
    ],
    'Manutenção Preventiva': [
      ChecklistItem('Verificar extintores'),
      ChecklistItem('Limpar calhas e telhados'),
      ChecklistItem('Podar vegetação próxima'),
      ChecklistItem('Manter hidrantes acessíveis'),
      ChecklistItem('Testar alarmes de incêndio'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checklist de Segurança'),
        backgroundColor: Colors.red[700],
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetChecklist,
            tooltip: 'Reiniciar Checklist',
          ),
        ],
      ),
      body: Column(
        children: [
          _buildProgresso(),
          Expanded(
            child: ListView.builder(
              itemCount: _categorias.length,
              itemBuilder: (context, index) {
                String categoria = _categorias.keys.elementAt(index);
                return _buildCategoria(categoria, _categorias[categoria]!);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _salvarProgresso,
        label: Text('Salvar Progresso'),
        icon: Icon(Icons.save),
        backgroundColor: Colors.red[700],
      ),
    );
  }

  Widget _buildProgresso() {
    int total = 0;
    int concluidos = 0;

    _categorias.forEach((_, items) {
      total += items.length;
      concluidos += items.where((item) => item.concluido).length;
    });

    double progresso = total > 0 ? concluidos / total : 0;

    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[100],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Progresso Geral',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${(progresso * 100).toInt()}%',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[700],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: progresso,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.red[700]!,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoria(String titulo, List<ChecklistItem> items) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ExpansionTile(
        title: Text(
          titulo,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: items.map((item) => _buildChecklistItem(item)).toList(),
      ),
    );
  }

  Widget _buildChecklistItem(ChecklistItem item) {
    return CheckboxListTile(
      title: Text(item.texto),
      value: item.concluido,
      onChanged: (bool? value) {
        setState(() {
          item.concluido = value ?? false;
        });
      },
      activeColor: Colors.red[700],
    );
  }

  void _resetChecklist() {
    setState(() {
      _categorias.forEach((_, items) {
        for (var item in items) {
          item.concluido = false;
        }
      });
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Checklist reiniciado')),
    );
  }

  void _salvarProgresso() {
    // Aqui você implementaria a lógica para salvar o progresso
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Progresso salvo com sucesso!')),
    );
  }
}

class ChecklistItem {
  final String texto;
  bool concluido;

  ChecklistItem(this.texto, {this.concluido = false});
}
