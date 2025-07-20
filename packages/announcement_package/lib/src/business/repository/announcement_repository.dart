import 'package:dartz/dartz.dart';
//CORE
import 'package:core/core.dart';
//BUSINESS
import 'package:announcement_package/src/business/entity/announcement_entity.dart';

abstract class AnnouncementRepository {
  Future<Either<Failure?, List<AnnouncementEntity>>> getAnnouncement();
}
