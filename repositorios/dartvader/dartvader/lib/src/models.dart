import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

DateTime identity(DateTime x) => x;

@JsonSerializable(includeIfNull: false)
class DartvaderVersion {
  final String version;
  final Map<String, dynamic> pubspec;
  final String? pubspecYaml;
  final String? uploader; // TODO: not sure why null. keep it nullable
  final String? readme;
  final String? changelog;

  @JsonKey(fromJson: identity, toJson: identity)
  final DateTime createdAt;

  DartvaderVersion(
    this.version,
    this.pubspec,
    this.pubspecYaml,
    this.uploader,
    this.readme,
    this.changelog,
    this.createdAt,
  );

  factory DartvaderVersion.fromJson(Map<String, dynamic> map) =>
      _$DartvaderVersionFromJson(map);

  Map<String, dynamic> toJson() => _$DartvaderVersionToJson(this);
}

@JsonSerializable()
class DartvaderPackage {
  final String name;
  final List<DartvaderVersion> versions;
  final bool private;
  final List<String>? uploaders;

  @JsonKey(fromJson: identity, toJson: identity)
  final DateTime createdAt;

  @JsonKey(fromJson: identity, toJson: identity)
  final DateTime updatedAt;

  final int? download;

  DartvaderPackage(
    this.name,
    this.versions,
    this.private,
    this.uploaders,
    this.createdAt,
    this.updatedAt,
    this.download,
  );

  factory DartvaderPackage.fromJson(Map<String, dynamic> map) =>
      _$DartvaderPackageFromJson(map);
}

@JsonSerializable()
class DartvaderQueryResult {
  int count;
  List<DartvaderPackage> packages;

  DartvaderQueryResult(this.count, this.packages);

  factory DartvaderQueryResult.fromJson(Map<String, dynamic> map) =>
      _$DartvaderQueryResultFromJson(map);
}
