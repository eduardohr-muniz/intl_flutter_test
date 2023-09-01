import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocaleDef extends ChangeNotifier {
  Locale locale = const Locale("pt", "");

  setLocale(Locale local) {
    locale = local;
    Intl.defaultLocale = "${local.languageCode}_${local.countryCode}";
    notifyListeners();
  }
}
