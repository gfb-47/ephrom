import '../features/posts/domain/entities/../../../../model/post.dart';

class PostModel extends Post {
  PostModel(
      {String? id,
      String? codigo,
      int? respostas,
      String? dataHora,
      bool? estaLido,
      String? autorID,
      String? autorNome,
      String? autorImageUrl,
      String? texto,
      int? versao})
      : super(
          id: id,
          codigo: codigo,
          respostas: respostas,
          dataHora: dataHora,
          estaLido: estaLido,
          autorID: autorID,
          autorNome: autorNome,
          autorImageUrl: autorImageUrl,
          texto: texto,
          versao: versao,
        );

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    codigo = json['Codigo'];
    respostas = json['Respostas'];
    dataHora = json['DataHora'];
    estaLido = json['EstaLido'];
    autorID = json['AutorID'];
    autorNome = json['AutorNome'];
    autorImageUrl = json['AutorImageUrl'];
    texto = json['Texto'];
    versao = json['Versao'];
  }
}
