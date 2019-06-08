import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//基础组件
class OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("New App!"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Flex 弹性布局测试"),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.green,
                    child: Text("尺寸1/3"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30,
                    color: Colors.blue,
                    child: Text("尺寸2/3"),
                  ),
                ),
              ],
            ),
            Text("Image 图片"),
            Image(
              image: AssetImage("images/phonecall_off.png"),
              width: 20,
              height: 20,
              fit: BoxFit.cover,
            ),
            Text("RaisedButton 按钮"),
            RaisedButton(
              child: Text("RaisedButton"),
              onPressed: () => {},
              textColor: Colors.red,
              color: Colors.blue,
              highlightColor: Colors.green,
              splashColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
            ),
            Text("FlatButton 按钮"),
            FlatButton(child: Text("FlatButton"), onPressed: () => {}),
            Text("OutlineButton 按钮"),
            OutlineButton(child: Text("OutlineButton"), onPressed: () => {}),
            Text("IconButton 按钮"),
            IconButton(icon: Icon(Icons.accessible), onPressed: () => {}),
            Text("TextField 输入框"),
            TextField(),
            Text("SingleChildScrollView 滚动布局测试"),
            //Column中嵌套可滚动布局，需要使用Expanded包裹
            Expanded(
              //显示滚动条
              child: Scrollbar(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  primary: true,
                  //IOS中弹性效果
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text("A"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text("B"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text("C"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text("D"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text("E"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text("F"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text("G"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text("H"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text("I"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text("J"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text("K"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text("L"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text("M"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text("N"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text("O"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text("P"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text("Q"),
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      resizeToAvoidBottomPadding: true, //输入框抵住键盘 内容不随键盘滚动
    );
  }
}
