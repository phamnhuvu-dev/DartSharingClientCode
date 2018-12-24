class Validator {
  bool validEmail(String email) {
    RegExp emailRegExp = new RegExp(r"[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+");
    final strMatch = emailRegExp.stringMatch(email);
    return strMatch == email;
  }

  validAccountName(String accountName) {
    RegExp nameRegExp = new RegExp(r"^[_A-z0-9]*((-|)*[_A-z0-9])*$");
    final strMatch = nameRegExp.stringMatch(accountName);
    return strMatch == accountName;
  }
}
