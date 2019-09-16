import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AsyncLoadUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试FutureBuilder"),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: mockNetworkData(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError){
                //请求失败
                return Text("Error:${snapshot.error}");
              }else{
                //请求成功
                return Text("Success:${snapshot.data}");
              }
            }else{
              //请求未结束，显示Loading
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "我是从网络获取到的数据");
  }
}
