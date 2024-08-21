class User {
  String? username;
  String? email;
  String? password;
  String? role;
  User(
      { this.username,
        required this.email,
        required this.password,
        required this.role,
        });
  factory User.fromJson(Map<String, dynamic> json) => User(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      role: json['role'],


  );


  Map<String, dynamic> toJson(){
    return {"username":username, "email":email, "password":password, "role":role};
  }






 
}