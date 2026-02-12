import 'package:intl/intl.dart';

abstract class CurrencyFormatter {
  static final _formatter = NumberFormat('#,##0.00');
  static final _formatterNoDecimals = NumberFormat('#,##0');

  static String format(double amount) {
    return _formatter.format(amount);
  }

  static String formatNoDecimals(double amount) {
    return _formatterNoDecimals.format(amount);
  }

  static String formatWithPrefix(double amount, {String prefix = 'KES '}) {
    return '$prefix${format(amount)}';
  }
}
