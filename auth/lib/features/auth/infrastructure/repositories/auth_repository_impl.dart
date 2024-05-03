import 'package:auth/features/auth/domain/domain.dart';
import 'package:auth/features/auth/infrastructure/infrastructure.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource _dataSource;

  AuthRepositoryImpl({AuthDatasource? dataSource})
      : _dataSource = dataSource ?? AuthDatasourceImpl();

  @override
  Future<User> checkAuthStatus(String token) {
    return _dataSource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) {
    return _dataSource.login(email, password);
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    return _dataSource.register(email, password, fullName);
  }
}
