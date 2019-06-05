//导入 Material UI 组件库
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:test_flutter/test/TestDart.dart';
import 'package:test_flutter/two.dart';

import 'one.dart';

void main() => runApp(MyApp());

//当前应用，继承自StatelessWidget，表示其是无状态的Widget
class MyApp extends StatelessWidget {
  //Flutter在构建页面时，会调用组件的build方法
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //应用名称
      title: 'Flutter Demo',

      //应用主题
      theme: ThemeData(
        //该颜色必须是 MaterialColor 的子类
        primarySwatch: Colors.green,
      ),

      //注册路由表
      routes: {
        "one_page": (context) => OnePage(),
        "two_page": (context) => TwoPage()
      },

      //应用首页
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//首页，继承自StatefulWidget，表示其是一个有状态的Widget
class MyHomePage extends StatelessWidget {
  final String title;

  //Dart中用分号代替空方法体，参数是可选参数
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //导航栏
      appBar: AppBar(
        title: Text(title),
      ),

      //界面的布局主体
      body: Center(
        //将其所有子widget沿屏幕垂直方向依次排列
        child: Column(
          //主轴对齐方式
          mainAxisAlignment: MainAxisAlignment.start,
          //次轴对齐方式
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            FlatButton(
              child: Text("基础控件测试!"),
              textColor: Colors.green,
              onPressed: () {
//                Navigator.push(context,
//                    //builder类型为函数类型，传入BuildContext，返回Widget,此处则为匿名函数
//                    CupertinoPageRoute(builder: (context)=>NewPage())
//                );
                Navigator.pushNamed(context, "one_page");
              },
            ),
            FlatButton(
              child: Text("Open New Page!"),
              textColor: Colors.green,
              onPressed: () {
//                Navigator.push(context,
//                    //builder类型为函数类型，传入BuildContext，返回Widget,此处则为匿名函数
//                    CupertinoPageRoute(builder: (context)=>NewPage())
//                );
                Navigator.pushNamed(context, "new_page");
              },
            ),
            FlatButton(
              child: Text("Test Async!"),
              textColor: Colors.green,
              onPressed: () {
                TestDart().testAsync();
              },
            ),
            FlatButton(
              child: Text("Test Async2!"),
              textColor: Colors.green,
              onPressed: () {
                TestDart().testAsync2();
              },
            ),
          ],
        ),
      ),

      resizeToAvoidBottomPadding: true, //输入框抵住键盘 内容不随键盘滚动
    );
  }
}
