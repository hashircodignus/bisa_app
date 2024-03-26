class UserModel{
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String?password;
  bool? status;
  var createdAt;

  UserModel({
    this.id,this.name,this.email,this.status,this.password,this.phoneNumber,this.createdAt
});
}