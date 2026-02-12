import 'package:flutter/material.dart';
import '../theme/hodi_text_styles.dart';
import '../utils/currency_formatter.dart';

class HodiAmountText extends StatelessWidget {
  final double amount;
  final TextStyle? style;
  final String prefix;

  const HodiAmountText({
    super.key,
    required this.amount,
    this.style,
    this.prefix = 'KES ',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$prefix${CurrencyFormatter.format(amount)}',
      style: style ?? HodiTextStyles.currency,
    );
  }
}
