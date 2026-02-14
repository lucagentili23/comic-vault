import 'package:comicvault/features/authentication/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<void> build() async {}

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _login(email, password));
  }

  Future<void> register(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _register(email, password));
  }

  Future<void> _login(String email, String password) async {
    final repository = ref.read(authRepositoryProvider);
    await repository.signInWithEmailAndPassword(email, password);
  }

  Future<void> _register(String email, String password) async {
    final repository = ref.read(authRepositoryProvider);
    await repository.createUserWithEmailAndPassword(email, password);
  }

  Future<void> logout() async {
    final repository = ref.read(authRepositoryProvider);
    await repository.signOut();
  }
}
