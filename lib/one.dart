import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//弹性布局
class OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("New App!"),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 30,
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 30,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}