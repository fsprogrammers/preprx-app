import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:preprx/model/auth/auth_request_models.dart';
import 'package:preprx/model/auth/auth_response_models.dart';
import 'package:preprx/repository/auth/auth_repository.dart';

class AuthState {
  final bool isLoading;
  final String? errorMessage;
  final RegisterResponseModel? registerResponse;
  final LoginResponseModel? loginResponse;

  const AuthState({
    required this.isLoading,
    required this.errorMessage,
    required this.registerResponse,
    required this.loginResponse,
  });

  const AuthState.initial()
    : isLoading = false,
      errorMessage = null,
      registerResponse = null,
      loginResponse = null;

  AuthState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
    RegisterResponseModel? registerResponse,
    LoginResponseModel? loginResponse,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      registerResponse: registerResponse ?? this.registerResponse,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }
}

class AuthViewModel extends Notifier<AuthState> {
  late final AuthRepository _repository;

  @override
  AuthState build() {
    _repository = ref.read(authRepositoryProvider);
    return const AuthState.initial();
  }

  Future<bool> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final response = await _repository.createAccount(
        RegisterRequestModel(
          username: username,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
        ),
      );

      state = state.copyWith(isLoading: false, registerResponse: response);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      return false;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final response = await _repository.loginAccount(
        LoginRequestModel(email: email, password: password),
      );

      state = state.copyWith(isLoading: false, loginResponse: response);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      return false;
    }
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final authViewModelProvider = NotifierProvider<AuthViewModel, AuthState>(
  AuthViewModel.new,
);
