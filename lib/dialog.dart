import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("测试弹框"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Text("对话框1"),
            onPressed: showDialogOne(),
          ),
          FlatButton()
        ],
      ),
    );
  }

  showDialogOne() {

  }
}
