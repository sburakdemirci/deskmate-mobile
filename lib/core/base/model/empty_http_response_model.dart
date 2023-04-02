import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'empty_http_response_model.g.dart';

@JsonSerializable()
class EmptyHttpResponseModel extends BaseModel<EmptyHttpResponseModel> {
  EmptyHttpResponseModel();

  @override
  EmptyHttpResponseModel fromJson(Map<String, dynamic> json) =>
      EmptyHttpResponseModel.fromJson(json);

  factory EmptyHttpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EmptyHttpResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EmptyHttpResponseModelToJson(this);

  EmptyHttpResponseModel copyWith({
    String? s,
  }) {
    return EmptyHttpResponseModel();
  }
}
