import 'package:announcement_package/announcement_package.dart';
import 'package:core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class AnnouncementDatasource {
  Future<Either<Failure, List<AnnouncementEntity>>> getAnnouncements() async {
    final announcementsList = AnnouncementData.announcementsList;

    if (announcementsList.isNotEmpty) {
      return Right(announcementsList);
    } else {
      return Left(GeneralFailure(errorMessage: "Error"));
    }
  }
}
