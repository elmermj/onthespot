import 'package:on_the_spot/network/repository/auth/auth_repository.dart';
import 'package:on_the_spot/network/repository/home/home_repository.dart';
import 'package:on_the_spot/network/service/auth/auth_service.dart';
import 'package:on_the_spot/network/service/home/home_service.dart';

class RepositoryStore {
  static final AuthRepository authRepository =
      AuthRepository(service: AuthService());
  static final HomeRepository homeRepository =
      HomeRepository(service: HomeService());
}