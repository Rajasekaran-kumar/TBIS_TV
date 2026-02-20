part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class OnLoginSuccess extends LoginState {
  final LoginModel loginResp;
  const OnLoginSuccess({required this.loginResp});

  @override
  List<Object> get props => [loginResp];
}

class OnFailure extends LoginState {
  final String error;
  final String timeStamp;

  const OnFailure({required this.error, required this.timeStamp});

  @override
  List<Object> get props => [error, timeStamp];
}
