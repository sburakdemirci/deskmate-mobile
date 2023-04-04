import 'package:deskmate/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'refresh_token_request_model.g.dart';

@JsonSerializable()
class RefreshTokenRequestModel extends BaseModel<RefreshTokenRequestModel> {
  String? refreshToken;

  RefreshTokenRequestModel({
    this.refreshToken,
  });

  @override
  RefreshTokenRequestModel fromJson(Map<String, dynamic> json) =>
      RefreshTokenRequestModel.fromJson(json);

  factory RefreshTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RefreshTokenRequestModelToJson(this);

  RefreshTokenRequestModel copyWith({
    String? refreshToken,
  }) {
    return RefreshTokenRequestModel(
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
