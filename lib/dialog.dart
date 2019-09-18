import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试弹框"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Text("对话框1"),
            onPressed: showDialogOne(context),
          ),
          FlatButton()
        ],
      ),
    );
  }

  showDialogOne(BuildContext context) async {
    bool delete = await showDeleteConfirmDialog(context);
    if(delete == null){
      print("取消删除");
    }else{
      print("已确认删除");
    }
  }

  Future<bool> showDeleteConfirmDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("标题"),
          content: Text("确定要删除当前文件吗？"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), //关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () => Navigator.of(context).pop(true), // 关闭对话框并返回true
            )
          ],
        );
      }
    );
  }


}
