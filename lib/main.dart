

//导入 Material UI 组件库
import 'package:flutter/material.dart';

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

      //应用首页
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//首页，继承自StatefulWidget，表示其是一个有状态的Widget
class MyHomePage extends StatefulWidget {

  final String title;

  //Dart中用分号代替空方法体，参数是可选参数
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
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
        title: Text(widget.title),
      ),

      //界面的布局主体
      body: Center(
        //将其所有子widget沿屏幕垂直方向依次排列
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("Open New Page!"),
              textColor: Colors.green,
              onPressed: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(builder:(context){
                      return new NewPage();
                    })
                );
              },
            )
          ],
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


class NewPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New App!"),
      ),
      body: Center(
        child: Text("This is body!"),
      ),
    );
  }

}
