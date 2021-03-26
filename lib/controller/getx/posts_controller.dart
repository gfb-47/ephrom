import 'package:ephrom/controller/getx/mockedup.dart';
import 'package:ephrom/model/post.dart';
import 'package:http/http.dart';
import '../api/post_remote_data_source.dart';
import 'package:get/get.dart';

class PostsController extends GetxController {
  var dataSource = PostDataSourceImpl(client: Client());
  var posts = <Post>[].obs;

  @override
  void onInit() {
    fetchPosts();
  }

  fetchPosts() async {
    List<Post> data = await dataSource.getPosts();
    for (var i = 0; i < data.length; i++) {
      posts.add(data[i]);
    }
    refactorHour();
  }

  refactorHour() {
    posts.forEach((element) {
      element.dataHora =
          '${element.dataHora.toString().substring(0, 2)}:${element.dataHora.toString().substring(0, 2)}';
    });
  }

  addPosts(String text) {
    posts.add(mockedUpPost(text));
  }

  editPost(String? id, String? text) {
    posts.forEach((element) {
      if (element.id == id) {
        element.texto = text;
      }
    });
    posts.refresh();
  }

  deletePost(String? id) {
    posts.removeWhere((element) => element.id == id);
  }
}
