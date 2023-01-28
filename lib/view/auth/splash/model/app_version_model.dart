import 'package:deskmate/core/base/model/base_model.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
part 'app_version_model.g.dart';

@immutable
@JsonSerializable()
class AppVersionModel extends BaseModel<AppVersionModel> {
  AppVersionModel({this.version, this.forceUpdate, this.aaa});
  final String? version;
  final bool? forceUpdate;
  final String? aaa;

  @override
  Map<String, dynamic> toJson() {
    return _$AppVersionModelToJson(this);
  }

  @override
  AppVersionModel fromJson(Map<String, dynamic> json) {
    return _$AppVersionModelFromJson(json);
  }

  AppVersionModel copyWith(
      {String? currentVersion, bool? isForceUpdate, String? aaa}) {
    return AppVersionModel(
        version: version ?? version,
        forceUpdate: forceUpdate ?? forceUpdate,
        aaa: aaa ?? aaa);
  }
}
