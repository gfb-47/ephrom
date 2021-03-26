import 'package:ephrom/model/post.dart';

Post mockedUpPost(text) => Post(
    id: '1111',
    autorID: '1234',
    autorNome: 'Gabriel Beckman',
    autorImageUrl: 'https://randomuser.me/api/portraits/men/73.jpg',
    dataHora: '1616451300000',
    texto: text);
