import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_model.dart';

part 'work_model.g.dart';

@immutable
@JsonSerializable()
class WorkModel extends BaseModel<WorkModel> {
  WorkModel({this.version, this.forceUpdate});
  final String? version;
  final bool? forceUpdate;

  @override
  Map<String, dynamic> toJson() {
    return _$WorkModelToJson(this);
  }

  @override
  WorkModel fromJson(Map<String, dynamic> json) {
    return _$WorkModelFromJson(json);
  }

  WorkModel copyWith(
      {String? currentVersion, bool? isForceUpdate, String? aaa}) {
    return WorkModel(
      version: version ?? version,
      forceUpdate: forceUpdate ?? forceUpdate,
    );
  }
}
