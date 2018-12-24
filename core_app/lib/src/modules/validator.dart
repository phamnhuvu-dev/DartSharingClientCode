class Validator {
  bool validEmail(String email) {
    RegExp emailRegExp = new RegExp(
        r"[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\@[a-zA-Z0-9][a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+");
    return emailRegExp.hasMatch(email);
  }

  validAccountName(String accountName) {
    RegExp nameRegExp = new RegExp(r"^[_A-z0-9]*((-|)*[_A-z0-9])*$");
    return nameRegExp.hasMatch(accountName);
  }
}
