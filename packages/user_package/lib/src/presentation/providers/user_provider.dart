import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//RESOURCES
import 'package:core/errors/failure.dart';
//PACKAGES
import 'package:user_package/user_package.dart';

class UserProvider extends ChangeNotifier {
  final UserDatasource datasource;
  final UserRepository repository;
  final UserUseCases useCases;

  List<int> subordinateList = [];
  Failure? failure;

  UserProvider({
    required this.datasource,
    required this.repository,
    required this.useCases,
  });

  //GET SUBORDINATE LIST
  Future<void> getSubordinateList(int superiorId) async {
    final result = await useCases.getSubordinatesListUseCase(superiorId);
    notifyListeners();
    return result.fold(
      (failure) {
        // Handle failure
        failure = GeneralFailure(errorMessage: "No data available !");
      },
      (subordinateList) {
        // Success case
        subordinateList = subordinateList;
      },
    );
  }
}

final userProvider = ChangeNotifierProvider<UserProvider>((ref) {
  final repository = ref.read(userRepositoryProvider);
  final dataSource = ref.read(userDataSourceProvider);
  final useCases = ref.read(userUseCasesProvider);

  return UserProvider(
    datasource: dataSource,
    repository: repository,
    useCases: useCases,
  );
});
