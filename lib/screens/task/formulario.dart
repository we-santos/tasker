import 'package:flutter/material.dart';
import 'package:tasker/components/editor.dart';
import 'package:tasker/models/task.dart';

const _tituloAppBar = 'Criando Task';

const _rotuloCampoDescricao = 'Descrição';
const _dicaCampoDescricao = 'Descrição';

const _rotuloCampoTitulo = 'Titulo';
const _dicaCampoTitulo = 'Titulo';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTaskState();
  }
}

class FormularioTaskState extends State<FormularioTask> {
  final TextEditingController _controladorCampoTitulo =
  TextEditingController();
  final TextEditingController _controladorCampoDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controladorCampoTitulo,
                dica: _dicaCampoTitulo,
                rotulo: _rotuloCampoTitulo,
              ),
              Editor(
                dica: _dicaCampoDescricao,
                controlador: _controladorCampoDescricao,
                rotulo: _rotuloCampoDescricao,
              ),
              ElevatedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () => _criaTask(context),
              ),
            ],
          ),
        ));
  }

  void _criaTask(BuildContext context) {
    final String? titulo = _controladorCampoTitulo.text;
    final String? descricao = _controladorCampoDescricao.text;
    if (titulo != null && descricao != null) {
      final taskCriada = Task(titulo, descricao);
      Navigator.pop(context, taskCriada);
    }
  }
}
