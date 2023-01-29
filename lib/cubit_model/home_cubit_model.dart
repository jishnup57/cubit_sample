import '../model/trial_model.dart';

class HomeCubitModel {
  bool isLoading;
  List<TrialModel> trialList;
  HomeCubitModel({this.isLoading = true, this.trialList = const []});
  HomeCubitModel copyWith({
    bool? isLoading,
    List<TrialModel>? trialList,
  }) {
    return HomeCubitModel(
      isLoading: isLoading ?? this.isLoading,
      trialList: trialList ?? this.trialList,
    );
  }
}
