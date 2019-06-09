import 'package:flutter/material.dart';

class FourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView测试"),
      ),
      body: GridView.builder(
        //横轴最大个数
        /*gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),*/

        //横轴最大长度
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120.0,
          childAspectRatio: 2.0, //宽高比为2
          mainAxisSpacing: 5, //主轴间隔
          crossAxisSpacing: 5, //横轴间隔
        ),
        itemBuilder: (BuildContext context, int index) {
          return _GridItem(index);
        },
      ),
    );
  }
}

class _GridItem extends StatelessWidget {
  List indexArray = new List();
  List colorArray = new List();
  int index;

  _GridItem(this.index) {
    indexArray.add(Icons.print);
    indexArray.add(Icons.ac_unit);
    indexArray.add(Icons.access_alarm);
    indexArray.add(Icons.zoom_out);
    indexArray.add(Icons.accessibility);
    indexArray.add(Icons.accessible_forward);
    indexArray.add(Icons.account_box);
    indexArray.add(Icons.account_balance_wallet);
    indexArray.add(Icons.adb);
    indexArray.add(Icons.add_a_photo);
    indexArray.add(Icons.add_alert);

    colorArray.add(Colors.red);
    colorArray.add(Colors.green);
    colorArray.add(Colors.grey);
    colorArray.add(Colors.yellow);
    colorArray.add(Colors.blue);
    colorArray.add(Colors.lime);
    colorArray.add(Colors.tealAccent);
    colorArray.add(Colors.purple);
    colorArray.add(Colors.teal);
    colorArray.add(Colors.redAccent);
    colorArray.add(Colors.indigo);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: colorArray[index % 11],
      child: Icon(
        indexArray[index % 11],
      ),
    );
  }
}
