class User {
  String accessToken;
  int id;
  String username;
  String accountName;
  String email;

  User(this.accessToken, this.id, this.username, this.accountName, this.email);

  User.fromJson(Map<String, dynamic> json)
      : accessToken = json["access_token"],
        id = json["user_id"],
        username = json["username"],
        accountName = json["account_name"],
        email = json["email"];
}
