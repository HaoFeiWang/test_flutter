import 'package:flutter/material.dart';

class TestStreamBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试StreamBuilder"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: counter(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              //请求失败
              return Text("Error:${snapshot.error}");
            }

            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('没有Stream');
              case ConnectionState.waiting:
                return Text('等待数据...');
              case ConnectionState.active:
                return Text('active: ${snapshot.data}');
              case ConnectionState.done:
                return Text('Stream已关闭');
            }

            return null;
          },
        ),
      ),
    );
  }

  Stream<int> counter() {
    //周期性执行
    return Stream.periodic(Duration(seconds: 1), (i) => i);
  }
}
