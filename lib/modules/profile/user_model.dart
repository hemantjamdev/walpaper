
class UserModel {
  String? uid;
  String? name;
  String? profilePic;

  UserModel({this.uid, this.name, this.profilePic});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        uid: map['uid'], name: map['name'], profilePic: map['profilePic']);
  }

  Map<String, dynamic> toMap() {
    return {"uid": uid, "name": name, "profilePic": profilePic};
  }
}
