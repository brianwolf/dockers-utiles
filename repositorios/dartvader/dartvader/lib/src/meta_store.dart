import 'package:dartvader/src/models.dart';

abstract class MetaStore {
  Future<DartvaderPackage?> queryPackage(String name);

  Future<void> addVersion(String name, DartvaderVersion version);

  Future<void> addUploader(String name, String email);

  Future<void> removeUploader(String name, String email);

  void increaseDownloads(String name, String version);

  Future<DartvaderQueryResult> queryPackages({
    required int size,
    required int page,
    required String sort,
    String? keyword,
    String? uploader,
    String? dependency,
  });
}
