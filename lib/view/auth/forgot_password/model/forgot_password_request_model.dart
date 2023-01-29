import 'package:deskmate/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'forgot_password_request_model.g.dart';

@JsonSerializable()
class ForgotPasswordRequestModel extends BaseModel<ForgotPasswordRequestModel> {
  String? email;

  ForgotPasswordRequestModel({
    this.email,
  });

  @override
  ForgotPasswordRequestModel fromJson(Map<String, dynamic> json) =>
      ForgotPasswordRequestModel.fromJson(json);

  factory ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ForgotPasswordRequestModelToJson(this);

  ForgotPasswordRequestModel copyWith({
    String? email,
  }) {
    return ForgotPasswordRequestModel(
      email: email ?? this.email,
    );
  }
}
