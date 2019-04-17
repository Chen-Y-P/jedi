import 'package:flutter/material.dart';
import 'package:jedi/navigation.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

class JediApp extends StatefulWidget {
  @override
  _JediAppState createState() => _JediAppState();
}

class _JediAppState extends State<JediApp> {
  final JPush jpush = JPush();

  @override
  void initState() {
    jpush.setup(
      appKey: "0d900709d234bc9825276054",
      channel: "theChannel",
      production: false,
      debug: false, // 设置是否打印 debug 日志
    );
    jpush.addEventHandler(
      // 接收通知回调方法。
      onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
      },
      // 点击通知回调方法。
      onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
      },
      // 接收自定义消息回调方法。
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Material应用组件，它包含了许多Material设计的应用程序通常需要的组件。
    return MaterialApp(
      // 标题属性，用于设备识别应用程序的单行描述。
      // 在Android上，标题显示在任务管理器的应用程序快照上方，但是在iOS上无法使用此值。
      title: 'JEDI',
      // home属性，应用程序默认路径（即`Navigator.defaultRouteName`或`/`）的组件。
      // 除非指定了initialRoute属性，否则这是在应用程序正常启动时首先显示的路由。
      // 如果无法显示initialRoute属性的路径，它也是显示的路径。
      home: NavigationPage(),
      // 在生成路由上属性，应用程序导航到命名路由时使用的路由生成器回调。
      onGenerateRoute: _getRoute,
    );
  }

  /// 路由（`Route`）是由导航器（`Navigator`）管理的条目的抽象类。
  /// 路由设置（`RouteSettings`）类是一些可能在构建路由时有用的数据。
  Route<dynamic> _getRoute(RouteSettings settings) {
    // RouteSettings.name属性，路由的名称（例如`/settings`）。
    final String name = settings.name;

    // if (name == '/initiate') {
    //   // Material页面路由（`MaterialPageRoute`）类，通过平台自适应转换替换整个屏幕的模态路由。
    //   // 对于Android，页面的入口转换会向上滑动页面并淡入其中。退出转换是相同的，但方向相反。
    //   // 在iOS上，页面从右侧滑入，然后反向退出。当另一页进入以覆盖它时，页面也会在视差中向左移动。
    //   return MaterialPageRoute<void> (
    //     // 设置属性，此路由的设置。
    //     settings: settings,
    //     // 构建者属性，构建路由的主要内容。
    //     builder: (BuildContext context) => InitiatePage(),
    //     fullscreenDialog: true,
    //   );
    // } else if (name == '/login') {
    //   return MaterialPageRoute<void> (
    //     settings: settings,
    //     builder: (BuildContext context) => LoginPage(),
    //     fullscreenDialog: true,
    //   );
    // } else {
    //   return null;
    // }
  }
}