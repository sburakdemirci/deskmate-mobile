import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';

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
  LoginResponseModel fromJson(Map<String, dynamic> json) =>
      LoginResponseModel.fromJson(json);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

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
