
class ShowerModel{
  String? name;
  String? uid;
  String? index;

  ShowerModel({this.name, this.uid, this.index});

  factory ShowerModel.fromMap(map){
    return ShowerModel(
        name: map['name'],
        uid: map['uid'],
        index: map['index']
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'uid': uid,
      'index': index,
    };
  }
}