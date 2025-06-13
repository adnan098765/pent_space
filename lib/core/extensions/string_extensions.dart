import 'package:intl/intl.dart';

extension StringExtensions on String {
  String toFormattedCurrency() {
    final formatter = NumberFormat('#,###,###');
    return isEmpty ? '' : formatter.format(num.parse(this));
  }
}
