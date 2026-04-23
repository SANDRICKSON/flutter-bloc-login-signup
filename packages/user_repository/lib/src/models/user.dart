import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/user_entity.dart';

class MyUser extends Equatable {
  final String userId;
  final String email;
  final String name;
  final String password;

  const MyUser({required this.userId, required this.email, required this.name, required this.password});

  static const empty = MyUser(userId: '', email: '', name: '',password: '');

  MyUser copyWith({String? userId, String? email, String? name}) {
    return MyUser(
        userId: userId ?? this.userId,
        email: email ?? this.email,
        name: this.name,password: this.password);
  }

  MyUserEntity toEntity() {
    return MyUserEntity(userId: userId, email: email, name: name, password: '');
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
        userId: entity.userId, email: entity.email, name: entity.name,password: entity.password);
  }

  @override
  List<Object?> get props => [userId, email, name];
}
