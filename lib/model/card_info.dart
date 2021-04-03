class CardInfo {
  String? cardNumber;
  String? name;
  String? validate;
  String? cvv;

  CardInfo({this.cardNumber, this.name, this.validate, this.cvv});

  @override
  String toString() {
    return "cardNumber=$cardNumber, name=$name, validate=$validate, cvv=$cvv";
  }
}
