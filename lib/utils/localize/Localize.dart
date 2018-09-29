import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Localize {
  final Locale locale;

  Localize(this.locale);

  static Localize of(BuildContext context) =>
      Localizations.of(context, Localize);

  Map<String, String> _sentences;

  Future<bool> load() async {
    String data = await rootBundle
        .loadString('lib/resources/lang/${this.locale.languageCode}.json');
    Map<String, dynamic> _result = json.decode(data);
    this._sentences = new Map();
    _result.forEach((String key, dynamic value) {
      this._sentences[key] = value.toString();
    });
    return true;
  }

  String trans(String key) => this._sentences[key];
}
