import '../../data/repo/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  bool execute(String email, String password) =>
      _authRepository.login(email, password);
}
