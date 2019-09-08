import 'dart:collection';

import 'package:flutter/material.dart';

class TestProvider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestProviderState();
  }
}

class _TestProviderState extends State<TestProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试Provider"),
      ),
      body: ChangeNotifierProvider<CartModel>(
        data: CartModel(),
        child: Center(
          child: Column(
            children: <Widget>[
              Builder(
                builder: (context) {
                  var cart = ChangeNotifierProvider.of<CartModel>(context);
                  return Text("总价 ${cart.totalPrice}");
                },
              ),
              Builder(
                builder: (context) {
                  print("RaiseButton build");
                  return RaisedButton(
                    child: Text("添加商品"),
                    onPressed: () {
                      ChangeNotifierProvider.of<CartModel>(context).add(Item(20.0, 1));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartModel extends ChangeNotifier {
  //用于保存实际数据（购物车商品）
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  void add(Item item) {
    _items.add(item);
    // 通知监听器（订阅者）
    notifyListeners();
  }
}

class Item {
  double price;
  int count;

  Item(this.price, this.count);
}

//保存需要共享的数据InheritedWidget，使用泛型的方式
class InheritedProvider<T> extends InheritedWidget {
  final T data;

  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}

Type _typeOf<T>() => T;

//ChangeNotifier是观察者模式
class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final T data;

  ChangeNotifierProvider({
    Key key,
    this.data,
    this.child,
  });

  static T of<T>(BuildContext context) {
    final type = _typeOf<InheritedProvider<T>>();
    print("type of = "+type.toString());
    final provider = context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>;
    return provider.data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() {
    return _ChangeNotifierProviderState<T>();
  }
}

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {
  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }

  void update() {
    setState(() {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }
}
