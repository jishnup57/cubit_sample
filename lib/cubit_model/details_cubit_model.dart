import 'package:bloc_routing_sample/model/trial_model.dart';

class DetailsCubitModel{
  bool isLoading;
  TrialModel? trial;
  DetailsCubitModel({this.isLoading = true,this.trial});
    DetailsCubitModel copyWith({
    bool? isLoading,
    TrialModel? trial,
  }) {
    return DetailsCubitModel(
      isLoading: isLoading ?? this.isLoading,
      trial: trial ?? this.trial,
    );
  }
}