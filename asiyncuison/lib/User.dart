class User {
  //"id":6809345,
  //"name":"Chandran Pothuvaal",
  //"email":"pothuvaal_chandran@wintheiser.test",
  //"gender":"female",
  //"status":"inactive"

  late int id;
  late String name;
  late String email;
  late String gender;
  late String status; // String? status;

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    gender = json["gender"];
    status = json["status"];
  }
}