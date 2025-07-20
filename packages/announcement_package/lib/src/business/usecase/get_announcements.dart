import 'package:announcement_package/src/business/entity/announcement_entity.dart';
import 'package:announcement_package/src/business/repository/announcement_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetAnnouncements {
  final AnnouncementRepository repository;

  GetAnnouncements({required this.repository});

  Future<Either<Failure?, List<AnnouncementEntity>>> call() async {
    return await repository.getAnnouncement();
  }
}
