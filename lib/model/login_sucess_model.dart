
class LoginSucessModel {
    LoginSucessModel({
        required this.status,
        required this.data,
        required this.message,
    });

    final int status;
    final Data data;
    final String message;

    factory LoginSucessModel.fromJson(Map<String, dynamic> json) => LoginSucessModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
    };
}

class Data {
    Data({
        required this.userData,
        required this.accessToken,
        required this.refreshToken,
    });

    final UserData userData;
    final String accessToken;
    final String refreshToken;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userData: UserData.fromJson(json["userData"]),
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
    );

    Map<String, dynamic> toJson() => {
        "userData": userData.toJson(),
        "accessToken": accessToken,
        "refreshToken": refreshToken,
    };
}

class UserData {
    UserData({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.phone,
        required this.isVerified,
    });

    final String id;
    final String firstName;
    final String lastName;
    final String email;
    final String phone;
    final bool isVerified;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        isVerified: json["isVerified"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "isVerified": isVerified,
    };
}
