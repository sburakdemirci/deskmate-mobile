import 'package:deskmate/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends BaseModel<LoginResponseModel> {
  String? userId;
  String? username;
  String? accessToken;
  String? refreshToken;

  LoginResponseModel({
    this.userId,
    this.username,
    this.accessToken,
    this.refreshToken,
  });

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$LoginResponseModelToJson(this);
  }

  LoginResponseModel copyWith({
    String? userId,
    String? username,
    String? accessToken,
    String? refreshToken,
  }) {
    return LoginResponseModel(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
