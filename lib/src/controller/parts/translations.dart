part of 'package:queen/src/controller/controller.dart';

extension StringTranslator on String {
  String get trs => tr(this);
}

mixin QTranslator on _QueenControllerImp {
  Future<void> setLocale(String langCode, [String? countryCode]) async {
    await context.setLocale(Locale(langCode, countryCode));
  }

  Locale get locale => context.locale;

  List<Locale> get supportedLocales => context.supportedLocales;

  List<LocalizationsDelegate<dynamic>> get localizationDelegates => context.localizationDelegates;
  //  TODO :: use queen_validators isRtl

  bool get isRTL => locale.languageCode == 'ar';

  //  TODO :: use queen_validators isLTR
  /// *
  bool get isLTR => !isRTL;

  /// *
  TextDirection get textDirection => isRTL ? TextDirection.rtl : TextDirection.ltr;
}
