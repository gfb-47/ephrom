import 'package:ephrom/controller/getx/posts_controller.dart';
import 'package:ephrom/view/widgets/floatingButton.dart';
import 'package:ephrom/view/widgets/modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostsController())!;
    return Scaffold(
      floatingActionButton: FloatingButton(context, controller),
      appBar: AppBar(
        title: Text(
          'Ephrom',
        ),
        backgroundColor: Color(0xFF405559),
      ),
      body: Container(
        color: Color.fromRGBO(44, 61, 64, 1),
        child: LayoutBuilder(
          builder: (context, constraints) => Obx(
            () => ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    height: constraints.maxHeight * 0.25,
                    child: Card(
                      elevation: 6,
                      color: Color(0xFF405559),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: constraints.maxWidth * 0.08,
                              width: constraints.maxWidth * 0.08,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: NetworkImage(
                                    controller.posts[index].autorImageUrl
                                        .toString(),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: constraints.maxHeight * 0.02,
                                    child: Text(
                                      '${controller.posts[index].autorNome}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    height: constraints.maxHeight * 0.02,
                                    child: Text(
                                      '${controller.posts[index].dataHora}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    height: constraints.maxHeight * 0.1,
                                    width: constraints.maxWidth * 0.75,
                                    child: Text(
                                      '${controller.posts[index].texto}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            controller.posts[index].autorID == '1234'
                                ? Container(
                                    width: constraints.maxWidth * 0.05,
                                    margin:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () => showModalBottomSheet(
                                                context: context,
                                                builder: (context) =>
                                                    ModalWidget()).then(
                                              (value) => controller.editPost(
                                                controller.posts[index].id,
                                                value,
                                              ),
                                            ),
                                            child: Icon(Icons.edit),
                                          ),
                                          InkWell(
                                            onTap: () => controller.deletePost(
                                                controller.posts[index].id),
                                            child: Icon(Icons.delete),
                                          )
                                        ]),
                                  )
                                : Container(
                                    width: constraints.maxWidth * 0.05,
                                    margin:
                                        EdgeInsets.only(left: 15, right: 15),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
