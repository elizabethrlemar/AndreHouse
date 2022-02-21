class User {

  String firstName = "";
  String lastName = "";
  String username = "";
  String password = "";

  User(this.firstName, this.lastName,this.username, this.password);

  User createUser(record){
    Map<String, dynamic> attributes = {
      'firstName': '',
      'lastName': '',
      'username': '',
      'password': ''
    };

    record.forEach((key, value) => {attributes[key] = value});

    User user = User(attributes['firstName'], attributes['lastName'], attributes['username'], attributes['password']);

    return user;

  }


}