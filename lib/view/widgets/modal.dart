import 'package:flutter/material.dart';

class ModalWidget extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) => Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            controller: textController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Please enter a search term'),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: FlatButton(
                padding: EdgeInsets.all(20),
                onPressed: () => Navigator.pop(context, textController.text),
                color: Color.fromRGBO(24, 61, 64, 1),
                child: Text(
                  'Postar',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ));
}
