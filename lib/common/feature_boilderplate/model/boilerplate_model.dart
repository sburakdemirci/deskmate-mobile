import '../../../core/base/model/base_model.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
part 'boilerplate_model.g.dart';

@immutable
@JsonSerializable()
class BoilerplateModel extends BaseModel<BoilerplateModel> {
  BoilerplateModel({this.version, this.forceUpdate});
  final String? version;
  final bool? forceUpdate;

  @override
  Map<String, dynamic> toJson() {
    return _$BoilerplateModelToJson(this);
  }

  @override
  BoilerplateModel fromJson(Map<String, dynamic> json) {
    return _$BoilerplateModelFromJson(json);
  }

  BoilerplateModel copyWith(
      {String? currentVersion, bool? isForceUpdate, String? aaa}) {
    return BoilerplateModel(
      version: version ?? version,
      forceUpdate: forceUpdate ?? forceUpdate,
    );
  }
}
