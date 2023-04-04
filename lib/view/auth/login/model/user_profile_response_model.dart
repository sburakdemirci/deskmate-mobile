import 'package:deskmate/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_profile_response_model.g.dart';

@JsonSerializable()
class UserProfileResponseModel extends BaseModel<UserProfileResponseModel> {
  String? id;
  String? email;
  String? name;
  String? avatarUrl;

  UserProfileResponseModel({
    this.id,
    this.email,
    this.name,
    this.avatarUrl,
  });

  @override
  UserProfileResponseModel fromJson(Map<String, dynamic> json) =>
      UserProfileResponseModel.fromJson(json);

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserProfileResponseModelToJson(this);

  UserProfileResponseModel copyWith({
    String? id,
    String? email,
    String? name,
    String? avatarUrl,
  }) {
    return UserProfileResponseModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
