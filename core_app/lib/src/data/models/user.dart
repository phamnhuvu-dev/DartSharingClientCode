class User {
  String accessToken;
  String username;
  String accountName;
  String email;

  User(this.accessToken, this.username, this.accountName, this.email);

  User.fromJson(Map<String, dynamic> json)
      : accessToken = json["access_token"],
        username = json["username"],
        accountName = json["account_name"],
        email = json["email"];
}
