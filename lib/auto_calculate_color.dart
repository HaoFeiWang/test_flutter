import 'package:flutter/material.dart';

class AutoCalculateColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试颜色变换的AppBar"),
      ),
      body: Column(
        children: <Widget>[
          _NavBar(
            color: Colors.blue,
            title: "标题",
          ),
          _NavBar(
            color: Colors.white,
            title: "标题",
          ),
        ],
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  final String title;

  //背景色
  final Color color;

  _NavBar({Key key, this.color, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(color: color, boxShadow: [
        //阴影
        BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 3),
          blurRadius: 3,
        ),
      ]),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //计算背景色亮度来确定Title颜色值
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}
