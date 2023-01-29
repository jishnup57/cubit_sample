import 'dart:convert';

import 'package:bloc_routing_sample/cubit_model/home_cubit_model.dart';
import 'package:bloc_routing_sample/service/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../model/trial_model.dart';

class HomeCubit extends Cubit<HomeCubitModel> {
  HomeCubit() : super(HomeCubitModel());

Future<void> fetchHomeData()async{
  emit(state.copyWith(isLoading: true));
  final result = await ServiceManger.makeApiCall('https://clinical-trial-qa.restoreme.care/api/v1/trials', {}, HttpMethod.GET);
  emit(state.copyWith(isLoading: false));
  if (result[0] != null) {
    final Response reponse = result[0];
    List<TrialModel> trialList = List<TrialModel>.from(json.decode(reponse.body).map((x) => TrialModel.fromJson(x)));
    emit(state.copyWith(trialList: trialList));
  } 
    
  }
  
}
