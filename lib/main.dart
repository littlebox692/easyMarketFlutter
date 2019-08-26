/*
 * @Description: main
 * @Author: luoguoxiong
 * @Date: 2019-08-15 10:08:01
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_market/page/index.dart';
import 'package:easy_market/utils/rem.dart';
import 'package:easy_market/router/index.dart';
// import 'package:easy_market/utils/cache.dart';

void main() async {
  runApp(MyApp());
  // SpUtil sp = await SpUtil.getInstance();
  // sp.putString('ss', 'ss缓存');
  // if (Platform.isAndroid) {
  //   //设置Android头部的导航栏透明
  //   SystemUiOverlayStyle systemUiOverlayStyle =
  //       SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // }
  //白色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
      .copyWith(statusBarBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
// 定义路由信息

  @override
  Widget build(BuildContext context) {
    // 设置设计稿的宽度
    Rem.setDesignWidth(750.0);
    return RestartWidget(
      child: MaterialApp(
        theme: ThemeData(backgroundColor: Colors.transparent),
        // 监听路由跳转
        onGenerateRoute: (RouteSettings settings) {
          return Router.run(settings);
        },
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Page(),
        ),
      ),
    );
  }
}

///这个组件用来重新加载整个child Widget的。当我们需要重启APP的时候，可以使用这个方案
///https://stackoverflow.com/questions/50115311/flutter-how-to-force-an-application-restart-in-production-mode
class RestartWidget extends StatefulWidget {
  final Widget child;

  RestartWidget({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  static restartApp(BuildContext context) {
    final _RestartWidgetState state =
        context.ancestorStateOfType(const TypeMatcher<_RestartWidgetState>());
    state.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }
}
