class Task {
  final String titulo;
  final String descricao;

  Task(
      this.titulo,
      this.descricao,
      );

  @override
  String toString() {
    return 'Task{titulo: $titulo, descricao: $descricao}';
  }
}
