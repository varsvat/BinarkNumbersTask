import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sailor/sailor.dart';

import 'utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Routes.createRoutes();

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/homepage',
      onGenerateRoute: Routes.sailor.generator(),
      navigatorKey: Routes.sailor.navigatorKey,
      navigatorObservers: [
        SailorLoggingObserver(),
        Routes.sailor.navigationStackObserver
      ],
    );
  }
}
