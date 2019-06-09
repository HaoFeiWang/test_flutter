import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThreePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThreePageState();
  }
}

class ThreePageState extends State<ThreePage> {
  int counter = 0;

  void incrementCounter() {
    //setState通知Flutter有状态发生了改变，Flutter收到通知后会执行build重新构建界面
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //类似于DecorView
    return Scaffold(
      //导航栏
      appBar: AppBar(
        title: Text("有状态页面"),
      ),

      //界面的布局主体
      body: Center(
        //将其所有子widget沿屏幕垂直方向依次排列
        child: Text(
          '$counter',
          style: Theme.of(context).textTheme.display1,
        ),
      ),

      //悬浮按钮
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
