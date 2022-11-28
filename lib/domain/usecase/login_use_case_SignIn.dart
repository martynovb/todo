import '../../data/repo/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  bool execute(String email, String password) =>
      authRepository.login(email, password);
}
