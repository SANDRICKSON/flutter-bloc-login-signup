import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable{

  final String userId;
  final String email;
  final String name;
  final String password;

  const MyUserEntity({required this.userId, required this.email, required this.name, required this.password});

  Map<String,Object> toDocument(){
    return{
      'userId':userId,
      'name':name,
      'email':email
    };
  }

  static MyUserEntity fromDocument(Map<String,dynamic>doc){
    return MyUserEntity(userId: doc['userId'], email: doc['email'], name: doc['name'],password: doc['password']);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [userId,email,name];

}