

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class NumberFormater{

  String numberComma({required double number, int stringDecimalLength = 2}) {
    // Create a NumberFormat instance with a custom pattern
    final formatter = NumberFormat('#,##,##,##,##0.00');

    // Format the number
    String formattedNumber = formatter.format(double.parse(number.toStringAsFixed(stringDecimalLength)));

    if (kDebugMode) {
      print(formattedNumber);
    }
    return formattedNumber;
  }

}