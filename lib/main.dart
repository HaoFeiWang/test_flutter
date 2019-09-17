//导入 Material UI 组件库
import 'package:flutter/material.dart';

import 'package:test_flutter/test/TestDart.dart';
import 'package:test_flutter/test_provider.dart';
import 'package:test_flutter/three.dart';
import 'package:test_flutter/two.dart';

import 'future_builder.dart';
import 'auto_calculate_color.dart';
import 'test_inherited.dart';
import 'five.dart';
import 'four.dart';
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
        "two_page": (context) => TwoPage(),
        "three_page": (context) => ThreePage(),
        "four_page": (context) => FourPage(),
        "five_page": (context) => FivePage(),
        "test_inherited": (context) => SixPage(),
        "test_provider": (context) => TestProvider(),
        "auto_calculate_color": (context) => AutoCalculateColor(),
        "asyn_load_ui": (context) => TestFutureBuilder(),
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
      body: Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        //将其所有子widget沿屏幕垂直方向依次排列
        child: Column(
          //主轴对齐方式（Column中 start:从上往下，end：从下往上)
          mainAxisAlignment: MainAxisAlignment.start,
          //次轴对齐方式（Column中 start:左对齐，end:右对齐）
          crossAxisAlignment: CrossAxisAlignment.start,
          //Column中 从下往上：up  从上往下：down
          verticalDirection: VerticalDirection.down,
          //主轴的尺寸大小
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: FlatButton(
                child: Text("基础控件测试!"),
                //按钮背景色
                color: Colors.grey,
                textColor: Colors.black,
                shape: RoundedRectangleBorder(),
                onPressed: () {
                  /*Navigator.push(context,
                    //builder类型为函数类型，传入BuildContext，返回Widget,此处则为匿名函数
                    CupertinoPageRoute(builder: (context)=>OnePage())
                );*/
                  Navigator.pushNamed(context, "one_page");
                },
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: FlatButton(
                child: Text("ListView测试"),
                color: Colors.grey,
                textColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, "two_page");
                },
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: FlatButton(
                child: Text("StatefulWidget测试"),
                color: Colors.grey,
                textColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, "three_page");
                },
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: FlatButton(
                child: Text("GridView测试"),
                color: Colors.grey,
                textColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, "four_page");
                },
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: FlatButton(
                child: Text("CustomScrollView测试"),
                color: Colors.grey,
                textColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, "five_page");
                },
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: FlatButton(
                child: Text("InheritedWidget测试"),
                color: Colors.grey,
                textColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, "test_inherited");
                },
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: FlatButton(
                child: Text("Provider测试"),
                color: Colors.grey,
                textColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, "test_provider");
                },
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: FlatButton(
                child: Text("CalculateColor测试"),
                color: Colors.grey,
                textColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, "auto_calculate_color");
                },
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: FlatButton(
                child: Text("异步加载UI"),
                color: Colors.grey,
                textColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, "asyn_load_ui");
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: FlatButton(
                child: Text("Test Async!"),
                color: Colors.grey,
                textColor: Colors.black,
                onPressed: () {
                  TestDart().testAsync();
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: FlatButton(
                child: Text("Test Async2!"),
                color: Colors.grey,
                textColor: Colors.black,
                onPressed: () {
                  TestDart().testAsync2();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
