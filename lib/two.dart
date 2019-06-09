import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TwoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TwoState();
  }
}

class TwoState extends State<TwoPage> {
  bool showTopBtn = false;
  ScrollController _controller;

  //initState只调用一次
  @override
  void initState() {
    super.initState();
    print(" ==== init state ==== ");
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset < 500 && showTopBtn) {
        setState(() {
          showTopBtn = false;
        });
      } else if (_controller.offset >= 500 && !showTopBtn) {
        setState(() {
          showTopBtn = true;
        });
      }
    });
  }


  //build 可能调用多次
  @override
  Widget build(BuildContext context) {
    print(" ==== build state ==== ");

    return Scaffold(
      appBar: AppBar(
        title: Text("ListView测试"),
      ),
      //ListView.separated可以生成分割器
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: 30,
        cacheExtent: 10,
        controller: _controller,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _ListItem(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return _SeparatorItem(index);
        },
      ),

      floatingActionButton: showTopBtn
          ? FloatingActionButton(
              onPressed: () {
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
              backgroundColor: Colors.red,
            )
          : null,
    );
  }

  @override
  void dispose() {
    super.dispose();
    //防止内存泄漏
    _controller.dispose();
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
