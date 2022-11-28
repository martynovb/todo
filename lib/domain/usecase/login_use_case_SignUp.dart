
import '../../data/repo/auth_repository2.dart';

class LoginUseCase2 {
  final AuthRepository2 authRepository;

  LoginUseCase2(this.authRepository);

  bool execute(String email, String password, String name) =>
      authRepository.login(email, password, name);
}