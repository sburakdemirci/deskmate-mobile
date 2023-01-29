import 'package:deskmate/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'app_version_model.g.dart';

@JsonSerializable()
class AppVersionModel extends BaseModel<AppVersionModel> {
  String? version;
  bool? forceUpdate;

  AppVersionModel({
    this.version,
    this.forceUpdate,
  });

  @override
  AppVersionModel fromJson(Map<String, dynamic> json) =>
      AppVersionModel.fromJson(json);

  factory AppVersionModel.fromJson(Map<String, dynamic> json) =>
      _$AppVersionModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AppVersionModelToJson(this);

  AppVersionModel copyWith({
    String? version,
    bool? forceUpdate,
  }) {
    return AppVersionModel(
      version: version ?? this.version,
      forceUpdate: forceUpdate ?? this.forceUpdate,
    );
  }
}
