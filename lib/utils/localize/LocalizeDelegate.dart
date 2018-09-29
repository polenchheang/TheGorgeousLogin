import 'package:flutter/material.dart';
import 'package:the_gorgeous_login/utils/localize/Localize.dart';

class LocalizeDelegate extends LocalizationsDelegate<Localize> {
  const LocalizeDelegate();

  @override
  bool isSupported(Locale locale) => ['km', 'en'].contains(locale.languageCode);

  @override
  Future<Localize> load(Locale locale) async {
    Localize localize = Localize(Locale("km"));
    await localize.load();
    return localize;
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localize> old) => false;
}
