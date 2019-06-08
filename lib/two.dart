import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView测试"),
      ),
      //ListView.separated可以生成分割器
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: 30,
        cacheExtent: 10,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _ListItem(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return _SeparatorItem(index);
        },
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  int index;

  _ListItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.green,
      child: Center(child: Text("元素：$index")),
//      margin: EdgeInsets.only(top: 5, bottom: 5),
    );
  }
}

class _SeparatorItem extends StatelessWidget {
  int index;

  _SeparatorItem(this.index);

  @override
  Widget build(BuildContext context) {
    return index % 2 == 0
        ? Divider(height: 5, color: Colors.yellow)
        : Divider(height: 5, color: Colors.red);
  }
}
