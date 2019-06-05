import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 基础 Widget测试
class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      //将其所有子widget沿屏幕垂直方向依次排列
      child: Column(
        //主轴对齐方式
        mainAxisAlignment: MainAxisAlignment.start,
        //次轴对齐方式
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
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
          Image(image: AssetImage("images/phonecall_off.png")),
          RaisedButton(child: Text("RaisedButton"), onPressed: () => {}),
          FlatButton(child: Text("FlatButton"), onPressed: () => {}),
          OutlineButton(child: Text("OutlineButton"), onPressed: () => {}),
          IconButton(icon: Icon(Icons.accessible), onPressed: () => {}),
          TextField(),
          Text("xxx" * 100),
//            Wrap(
//              direction: Axis.horizontal,
//              children: <Widget>[Text("xxx" * 100)],
//            )
        ],
      ),
    );
  }
}
