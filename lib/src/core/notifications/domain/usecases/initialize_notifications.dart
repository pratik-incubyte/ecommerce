import 'package:dartz/dartz.dart';
import '../../../error/failures.dart';
import '../../../utils/usecase.dart';
import '../repositories/notification_repository.dart';

/// Use case for initializing notification services
class InitializeNotifications implements UseCase<Unit, NoParams> {
  final NotificationRepository repository;

  InitializeNotifications(this.repository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await repository.initializeNotifications();
  }
}
