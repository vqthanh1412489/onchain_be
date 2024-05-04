extension StringFormatting on String {
  String formatAddressString() {
    if (length < 10) {
      return this;
    }
    String firstPart = substring(0, 4);
    String lastPart = substring(length - 3);
    return '$firstPart...$lastPart';
  }
}

extension DateFormatExtension on DateTime {
  String toFormattedString() {
    return "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${year.toString()}";
    // return DateTime.now().toString();
  }
}

extension DecimalConversion on String {
  int convertToDecimal(int contractDecimals) {
    BigInt largeInteger = BigInt.parse(this);
    int decimals = contractDecimals;
    double decimalNumber = largeInteger / BigInt.from(10).pow(decimals);
    return decimalNumber.toInt();
  }
}
