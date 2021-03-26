class Post {
  String? id;
  String? codigo;
  int? respostas;
  String? dataHora;
  bool? estaLido;
  String? autorID;
  String? autorNome;
  String? autorImageUrl;
  String? texto;
  int? versao;

  Post({
    this.id,
    this.codigo,
    this.respostas,
    this.dataHora,
    this.estaLido,
    this.autorID,
    this.autorNome,
    this.autorImageUrl,
    this.texto,
    this.versao,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
