import 'package:bloc_routing_sample/routes/app_routes.dart';
import 'package:bloc_routing_sample/screen/splash.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRoutes _appRoutes = AppRoutes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: _appRoutes.onGenereteRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const Splash(),
    );
  }

  @override
  void dispose() {
    _appRoutes.dispose();
    super.dispose();
  }
}
