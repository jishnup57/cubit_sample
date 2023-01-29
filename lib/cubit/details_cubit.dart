import 'dart:convert';

import 'package:bloc_routing_sample/cubit_model/details_cubit_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../model/trial_model.dart';
import '../service/service.dart';

class DetailsCubit extends Cubit<DetailsCubitModel>{
  DetailsCubit() : super(DetailsCubitModel());

  Future<void> fetchDetailsData(String id)async{
  emit(state.copyWith(isLoading: true));
  final result = await ServiceManger.makeApiCall('https://clinical-trial-qa.restoreme.care/api/v1/trials/$id', {}, HttpMethod.GET);
  emit(state.copyWith(isLoading: false));
  if (result[0] != null) {
    final Response response = result[0];
    TrialModel trial =  TrialModel.fromJson(json.decode(response.body));
    emit(state.copyWith(trial: trial));
  } 
    
  }

}