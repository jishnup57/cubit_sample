import 'package:bloc_routing_sample/cubit/details_cubit.dart';
import 'package:bloc_routing_sample/cubit/home_cubit.dart';
import 'package:bloc_routing_sample/cubit/login_cubit.dart';
import 'package:bloc_routing_sample/screen/detail_screen.dart';
import 'package:bloc_routing_sample/screen/home_screen.dart';
import 'package:bloc_routing_sample/screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screen/login_screen.dart';

class AppRoutes {
  final LoginCubit _loginCubit = LoginCubit();
  final HomeCubit _homeCubit = HomeCubit();
  final DetailsCubit _detailsCubit = DetailsCubit();
  Route? onGenereteRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Splash());

      case '/login':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>.value(
            value: _loginCubit,
            child: LoginScreen(),
          ),
        );

      case '/home':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<HomeCubit>.value(
                  value: _homeCubit,
                  child: const Home(),
                ));

      case '/details':
        final args = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _loginCubit,
                  child: BlocProvider<DetailsCubit>.value(
                    value: _detailsCubit,
                    child: DetailsTrials(
                      trialId: args,
                    ),
                  ),
                ));
      default:
        return null;
    }
  }

  void dispose() {}
}
