import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'empty_response_model.g.dart';

@JsonSerializable()
class EmptyResponseModel extends BaseModel<EmptyResponseModel> {
  EmptyResponseModel();

  @override
  EmptyResponseModel fromJson(Map<String, dynamic> json) =>
      EmptyResponseModel.fromJson(json);

  factory EmptyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EmptyResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EmptyResponseModelToJson(this);

  EmptyResponseModel copyWith({
    String? s,
  }) {
    return EmptyResponseModel();
  }
}
