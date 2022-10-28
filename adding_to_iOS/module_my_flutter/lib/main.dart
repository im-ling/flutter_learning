import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import "dart:convert";

void main() {
  ///这里的CustomFlutterBinding调用务必不可缺少，用于控制Boost状态的resume和pause
  CustomFlutterBinding();
  runApp(MyApp());
}

///创建一个自定义的Binding，继承和with的关系如下，里面什么都不用写
class CustomFlutterBinding extends WidgetsFlutterBinding
    with BoostFlutterBinding {}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  /// 由于很多同学说没有跳转动画，这里是因为之前exmaple里面用的是 [PageRouteBuilder]，
  /// 其实这里是可以自定义的，和Boost没太多关系，比如我想用类似iOS平台的动画，
  /// 那么只需要像下面这样写成 [CupertinoPageRoute] 即可
  /// (这里全写成[MaterialPageRoute]也行，这里只不过用[CupertinoPageRoute]举例子)
  ///
  /// 注意，如果需要push的时候，两个页面都需要动的话，
  /// （就是像iOS native那样，在push的时候，前面一个页面也会向左推一段距离）
  /// 那么前后两个页面都必须是遵循CupertinoRouteTransitionMixin的路由
  /// 简单来说，就两个页面都是CupertinoPageRoute就好
  /// 如果用MaterialPageRoute的话同理
  ///
  // RouteSettings? static_settings;
  static Map<String, FlutterBoostRouteFactory> routerMap = {
    'mainPage': (RouteSettings settings, String? uniqueId) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (_) {
            Map<String, dynamic> map =
                settings.arguments as Map<String, dynamic>;
            String data = map['data'] as String;
            debugPrint(data);
            return MainPage(
              data: data,
            );
          });
    },
    'simplePage': (settings, uniqueId) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (_) {
            Map<String, dynamic> map =
                settings.arguments as Map<String, dynamic>;
            String data = map['data'] ?? "123";
            debugPrint(data);
            return SimplePage(
              data: data,
            );
          });
    },
  };

  Route<dynamic>? routeFactory(RouteSettings settings, String? uniqueId) {
    FlutterBoostRouteFactory? func = routerMap[settings.name!];
    if (func == null) {
      return null;
    }
    return func(settings, uniqueId);
  }

  // Route<dynamic>? routeFactory(RouteSettings settings, String? uniqueId) {
  //   FlutterBoostRouteFactory func =
  //       routerMap[settings.name] as FlutterBoostRouteFactory;
  //   return func(settings, uniqueId);
  // }

  Widget appBuilder(Widget home) {
    return MaterialApp(
      home: home,
      debugShowCheckedModeBanner: true,

      ///必须加上builder参数，否则showDialog等会出问题
      builder: (_, __) {
        return home;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(
      routeFactory,
      appBuilder: appBuilder,
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Object? data});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Main Page')),
    );
  }
}

var global_i = 0;

class SimplePage extends StatelessWidget {
  const SimplePage({Object? data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 200),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  debugPrint("Elevated button pressed");
                  // BoostNavigator.instance.pop();
                  ///这里添加监听，原生利用'event'这个key发送过来消息的时候，下面的函数会调用，
                  ///这里就是简单的在flutter上弹一个弹窗
                  if (global_i == 0) {
                    global_i++;
                    BoostChannel.instance.addEventListener("eventToFlutter",
                        (key, arguments) {
                      debugPrint("lllll");
                      debugPrint(key);
                      debugPrint(jsonEncode(arguments));
                      return Future.delayed(const Duration(seconds: 2), () {
                        debugPrint("what fuck !!!");
                      });
                    });
                  }

                  BoostChannel.instance
                      .sendEventToNative("eventToNative", {"key1": "value1"});
                },
                child: const Text("Channel test")),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  BoostNavigator.instance.push(
                    "yourPage", //required
                    withContainer: false, //optional
                    arguments: {"key": "value"}, //optional
                    opaque: true, //optional,default value is true
                  );

                  ///or
                  // Navigator.of(context).pushNamed('simplePage',
                  //     arguments: {'data': _controller.text});
                },
                child: const Text("push native")),
          ),
        ],
      ),
    );
  }
}
