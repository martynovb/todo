
import '../../data/repo/auth_repository2.dart';

class LoginUseCaseRegistration {
  final AuthRepository2 authRepository;

  LoginUseCaseRegistration(this.authRepository);

  bool execute(String email, String password, String name) =>
      authRepository.login(email, password, name);
}