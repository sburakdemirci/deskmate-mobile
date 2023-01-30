import '../../../../core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel extends BaseModel<LoginRequestModel> {
  String? email;
  String? password;

  LoginRequestModel({
    this.email,
    this.password,
  });

  @override
  LoginRequestModel fromJson(Map<String, dynamic> json) =>
      LoginRequestModel.fromJson(json);

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);

  LoginRequestModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
