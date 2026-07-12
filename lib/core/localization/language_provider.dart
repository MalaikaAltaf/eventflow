import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'app_localizations.dart';

/// A wrapper provider for backward compatibility. Directs translation calls to EasyLocalization.
class LanguageProvider extends StatefulWidget {
  final Widget child;

  const LanguageProvider({super.key, required this.child});

  static _LanguageProviderState of(BuildContext context) {
    final state = context.findAncestorStateOfType<_LanguageProviderState>();
    assert(state != null, 'LanguageProvider not found in widget tree');
    return state!;
  }

  @override
  State<LanguageProvider> createState() => _LanguageProviderState();
}

class _LanguageProviderState extends State<LanguageProvider> {
  void setLanguageFromString(String value) {
    if (value == 'اردو') {
      context.setLocale(const Locale('ur'));
    } else {
      context.setLocale(const Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

/// Extension on BuildContext for easy access.
extension LanguageContext on BuildContext {
  AppLocalizations get loc {
    final isUr = locale.languageCode == 'ur';
    return AppLocalizations(isUr ? AppLanguage.urdu : AppLanguage.english);
  }

  bool get isUrdu {
    return locale.languageCode == 'ur';
  }
}
