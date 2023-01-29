import 'dart:convert';

import 'package:bloc_routing_sample/cubit_model/login_cubit_model.dart';
import 'package:bloc_routing_sample/model/login_sucess_model.dart';
import 'package:bloc_routing_sample/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class LoginCubit extends Cubit<LoginCubitModel> {
  LoginCubit() : super(LoginCubitModel());

  void changePasswordVisibility() {
    emit(state.copyWith(passwordVisibility: !state.passwordVisibility));
  }

  void increment() {
    emit(state.copyWith(count: state.count + 1));
  }

  Future<void> loginSubmit(
      String email, String password, BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    final result = await ServiceManger.makeApiCall(
        'https://clinical-trial-qa.restoreme.care/api/v1/auth/login',
        {
          "username": email,
          "password": password,
        },
        HttpMethod.POST);
    emit(state.copyWith(isLoading: false));
    if (result[0] != null) {
      final Response reponse = result[0];
      final LoginSucessModel sucessModel =
          LoginSucessModel.fromJson(jsonDecode(reponse.body));
      await ServiceManger.saveToSharePref(sucessModel.data.accessToken);
    Navigator.pushNamed(context, '/home');
    } else {
      print(result[1]);
    }
  }
}
