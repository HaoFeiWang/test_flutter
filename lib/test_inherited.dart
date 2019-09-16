import 'package:flutter/material.dart';

class SixPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SixPageStatus();
  }
}

class _SixPageStatus extends State<SixPage> {
  @override
  Widget build(BuildContext context) {
    return new _InheritedWidgetTestRoute();
  }
}


class _InheritedWidgetTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InheritedWidgetTestRouteState();
  }
}

class _InheritedWidgetTestRouteState extends State<_InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget测试"),
      ),
      body: Center(
        child: _ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: _TestWidget(),
              ),
              RaisedButton(
                child: Text("增加"),
                onPressed: () => setState(() => ++count),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ShareDataWidget extends InheritedWidget {
  _ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  //需要在子树中共享的数据
  final int data;

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static _ShareDataWidget of(BuildContext context) {
    //该方法决定了存在依赖
    return context.inheritFromWidgetOfExactType(_ShareDataWidget);

    //该方法就不存在依赖关系
    //return context.ancestorInheritedElementForWidgetOfExactType(_ShareDataWidget).widget;
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(_ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TestWidgetState();
  }
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(_ShareDataWidget.of(context).data.toString());
    //return Text("1");
  }

  @override
  void didChangeDependencies() {
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    super.didChangeDependencies();
    print("Dependencies change");
  }
}
