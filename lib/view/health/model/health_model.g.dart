// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthModel _$HealthModelFromJson(Map<String, dynamic> json) => HealthModel(
      version: json['version'] as String?,
      forceUpdate: json['forceUpdate'] as bool?,
    );

Map<String, dynamic> _$HealthModelToJson(HealthModel instance) =>
    <String, dynamic>{
      'version': instance.version,
      'forceUpdate': instance.forceUpdate,
    };
