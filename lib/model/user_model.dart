import 'package:firebase_auth/firebase_auth.dart';

class UserModel{
  String? uid;
  String? username;
  String? firstName;
  String? lastName;
  String? userType;

  UserModel({this.uid, this.username, this.firstName, this.lastName, this.userType});

  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      username: map['username'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      userType: map['userType']
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'userType': userType,
    };
  }
}