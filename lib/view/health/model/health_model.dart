import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_model.dart';

part 'health_model.g.dart';

@immutable
@JsonSerializable()
class HealthModel extends BaseModel<HealthModel> {
  HealthModel({this.version, this.forceUpdate});
  final String? version;
  final bool? forceUpdate;

  @override
  Map<String, dynamic> toJson() {
    return _$HealthModelToJson(this);
  }

  @override
  HealthModel fromJson(Map<String, dynamic> json) {
    return _$HealthModelFromJson(json);
  }

  HealthModel copyWith(
      {String? currentVersion, bool? isForceUpdate, String? aaa}) {
    return HealthModel(
      version: version ?? version,
      forceUpdate: forceUpdate ?? forceUpdate,
    );
  }
}
