import 'package:ephrom/controller/getx/posts_controller.dart';
import 'package:flutter/material.dart';

import 'modal.dart';

Widget FloatingButton(BuildContext context, PostsController controller) =>
    FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => ModalWidget()).then((value) {
          value != null ? controller.addPosts(value) : null;
        });
      },
      elevation: 10,
      backgroundColor: Color.fromRGBO(24, 61, 64, 1),
      child: Icon(Icons.add),
    );
