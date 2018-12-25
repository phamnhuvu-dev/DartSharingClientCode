class CheckValue {
  static isNumber(value) {
    try {
      value/1;
      return true;
    } catch(e) {
      return false;
    }
  }
}