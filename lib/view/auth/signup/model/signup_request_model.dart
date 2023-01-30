import '../../../../core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'signup_request_model.g.dart';

@JsonSerializable()
class SignupRequestModel extends BaseModel<SignupRequestModel> {
  String? name;
  String? email;
  String? password;

  SignupRequestModel({
    this.name,
    this.email,
    this.password,
  });

  @override
  SignupRequestModel fromJson(Map<String, dynamic> json) =>
      _$SignupRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SignupRequestModelToJson(this);

  SignupRequestModel copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return SignupRequestModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
