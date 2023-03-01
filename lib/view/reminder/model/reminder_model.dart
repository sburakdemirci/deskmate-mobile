import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_model.dart';

part 'reminder_model.g.dart';

@immutable
@JsonSerializable()
class ReminderModel extends BaseModel<ReminderModel> {
  ReminderModel({this.version, this.forceUpdate});
  final String? version;
  final bool? forceUpdate;

  @override
  Map<String, dynamic> toJson() {
    return _$ReminderModelToJson(this);
  }

  @override
  ReminderModel fromJson(Map<String, dynamic> json) {
    return _$ReminderModelFromJson(json);
  }

  ReminderModel copyWith(
      {String? currentVersion, bool? isForceUpdate, String? aaa}) {
    return ReminderModel(
      version: version ?? version,
      forceUpdate: forceUpdate ?? forceUpdate,
    );
  }
}
