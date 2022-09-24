import 'package:get/get.dart';
import '../langs/arabic.dart';
import '../langs/russian.dart';
import '../langs/english.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': arabic,
        'ru': russian,
        'en': english,
      };
}
