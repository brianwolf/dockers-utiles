// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DartvaderVersion _$DartvaderVersionFromJson(Map<String, dynamic> json) => DartvaderVersion(
      json['version'] as String,
      json['pubspec'] as Map<String, dynamic>,
      json['pubspecYaml'] as String?,
      json['uploader'] as String?,
      json['readme'] as String?,
      json['changelog'] as String?,
      identity(json['createdAt'] as DateTime),
    );

Map<String, dynamic> _$DartvaderVersionToJson(DartvaderVersion instance) {
  final val = <String, dynamic>{
    'version': instance.version,
    'pubspec': instance.pubspec,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pubspecYaml', instance.pubspecYaml);
  writeNotNull('uploader', instance.uploader);
  writeNotNull('readme', instance.readme);
  writeNotNull('changelog', instance.changelog);
  writeNotNull('createdAt', identity(instance.createdAt));
  return val;
}

DartvaderPackage _$DartvaderPackageFromJson(Map<String, dynamic> json) => DartvaderPackage(
      json['name'] as String,
      (json['versions'] as List<dynamic>)
          .map((e) => DartvaderVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['private'] as bool,
      (json['uploaders'] as List<dynamic>?)?.map((e) => e as String).toList(),
      identity(json['createdAt'] as DateTime),
      identity(json['updatedAt'] as DateTime),
      json['download'] as int?,
    );

DartvaderQueryResult _$DartvaderQueryResultFromJson(Map<String, dynamic> json) =>
    DartvaderQueryResult(
      json['count'] as int,
      (json['packages'] as List<dynamic>)
          .map((e) => DartvaderPackage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
