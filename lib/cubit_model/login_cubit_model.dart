class LoginCubitModel {
  LoginCubitModel({
   this.passwordVisibility = false,
    this.isLoading = false,
    this.count = 0,
  });

  bool passwordVisibility ;
  bool isLoading ;
  int count;

  LoginCubitModel copyWith({
    bool? passwordVisibility,
    bool? isLoading,
    int? count,
  }) {
    return LoginCubitModel(
      passwordVisibility: passwordVisibility ?? this.passwordVisibility,
      isLoading: isLoading ?? this.isLoading,
      count: count ?? this.count,
    );
  }
  
}