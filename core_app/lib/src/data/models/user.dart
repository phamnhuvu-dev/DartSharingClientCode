class User {
  String access_token;
  String username;
  String accountName;
  String email;

  User(this.access_token, this.username, this.accountName, this.email);

  User.fromJson(Map<String, dynamic> json)
      : access_token = json["access_token"],
        username = json["username"],
        accountName = json["account_name"],
        email = json["email"];
}
