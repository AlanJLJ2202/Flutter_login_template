class User{
  int id;
  String name;
  String email;
  String balance;
  String remember_token;

  User({required this.id, required this.name, required this.email, required this.balance, required this.remember_token});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    balance: json["balance"],
    remember_token: json["remember_token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "balance": balance,
    "remember_token": remember_token,
  };
}