import 'package:flutter/material.dart';

//保存需要共享的数据InheritedWidget，使用泛型的方式
class InheritedProvider<T> extends InheritedWidget {
  final T data;

  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return null;
  }
}



class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

}