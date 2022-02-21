import 'package:firebase_database/firebase_database.dart';
import '../User/user.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference newUser(User user) {
  var id = databaseReference.child('users/').push();
  id.set({});
}