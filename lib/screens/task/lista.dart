
import 'package:flutter/material.dart';
import 'package:tasker/models/task.dart';

import 'formulario.dart';

const _tituloAppBar = 'Tasks';

class ListaTask extends StatefulWidget {
  final List<Task> _tasks = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTaskState();
  }
}

class ListaTaskState extends State<ListaTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._tasks.length,
        itemBuilder: (context, indice) {
          final task = widget._tasks[indice];
          return ItemTask(task);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTask();
          })).then(
                (taskRecebida) => _atualiza(taskRecebida),
          );
        },
      ),
    );
  }

  void _atualiza(Task taskRecebida) {
    debugPrint('chegou aqui fora');
    if (taskRecebida != null) {
      debugPrint('chegou aqui dentro');
      setState(() {
        widget._tasks.add(taskRecebida);
      });
    }
  }
}

class ItemTask extends StatelessWidget {
  final Task _task;

  ItemTask(this._task);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.check),
          title: Text(_task.titulo),
          subtitle: Text(_task.descricao),
        ));
  }
}
