
//所有的日志都打印在同一个线程，但是有不会阻塞
class TestDart {
  void testAsync() {
    //获取当前时间戳
    int start = DateTime.now().millisecondsSinceEpoch;
    print("test start time $start");

    Future.delayed(Duration(seconds: 5), () {
      return "hello dart";
    }).then((str) {
      int end = DateTime.now().millisecondsSinceEpoch;
      print("test end time $end duration = ${end - start} result = $str");
    });

    print("method end time ${DateTime.now().millisecondsSinceEpoch}");
  }

  //await 中，可以正常执行方法 testAsync
  void testAsync2() async {
    //获取当前时间戳
    int start = DateTime.now().millisecondsSinceEpoch;
    print("test start time $start");

    var str = await Future.delayed(Duration(seconds: 3),(){return "hello dart";});
    print("await result = $str");

    print("method end time ${DateTime.now().millisecondsSinceEpoch}");

  }
}
