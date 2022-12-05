


import 'package:todo/data/repo/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});

  Future<bool> execute(String email, String password, String name) =>
      authRepository.signUp(email, password, name);
}