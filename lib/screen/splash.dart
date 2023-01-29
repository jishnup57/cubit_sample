import 'dart:developer';

import 'package:bloc_routing_sample/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
 Future<String> checkToken() async {
    final token = await ServiceManger.getToken();
    return token;
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_)async {
      final token = await checkToken();
      log(token.toString());
      if (token == '') {
        Navigator.pushNamed(context, '/login');
      } else {
        Navigator.pushNamed(context, '/home');
      }
    });
    return Container();
  }
}
