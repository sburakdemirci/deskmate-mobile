import 'package:deskmate/core/base/model/base_model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@immutable
@JsonSerializable()
class LoginModel extends BaseModel<LoginModel> {
  LoginModel({this.email, this.password});
  final String? email;
  final String? password;

  @override
  LoginModel fromJson(Map<String, Object?> json) {
    return _$LoginModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$LoginModelToJson(this);
  }
}
