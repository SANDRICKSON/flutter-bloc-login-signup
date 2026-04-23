part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthenticationUserChanged extends AuthenticationEvent{
  final User? user;
  AuthenticationUserChanged(this.user);
}