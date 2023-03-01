import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_model.dart';

part 'profile_model.g.dart';

@immutable
@JsonSerializable()
class ProfileModel extends BaseModel<ProfileModel> {
  ProfileModel({this.version, this.forceUpdate});
  final String? version;
  final bool? forceUpdate;

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileModelToJson(this);
  }

  @override
  ProfileModel fromJson(Map<String, dynamic> json) {
    return _$ProfileModelFromJson(json);
  }

  ProfileModel copyWith(
      {String? currentVersion, bool? isForceUpdate, String? aaa}) {
    return ProfileModel(
      version: version ?? version,
      forceUpdate: forceUpdate ?? forceUpdate,
    );
  }
}
