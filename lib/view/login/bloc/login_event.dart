part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class PostLoginEvent extends LoginEvent {
  final Map<String, dynamic> loginData;
  const PostLoginEvent({
    required this.loginData,
  });
  @override
  // TODO: implement props
  List<Object> get props => [loginData];
}
