import 'package:firebase_database/firebase_database.dart';
import '../User/user.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference createUser(User user) {
  var id = databaseReference.child('users/').push();
  return id;
}