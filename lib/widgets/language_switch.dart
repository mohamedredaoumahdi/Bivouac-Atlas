import 'package:flutter/material.dart';
import '../main.dart';
import '../l10n/app_localizations.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = Localizations.localeOf(context);
    
    return PopupMenuButton<Locale>(
      icon: const Icon(
        Icons.language,
        color: Colors.white,
      ),
      tooltip: l10n.changeLanguage,
      onSelected: (Locale locale) {
        BivouacAtlasApp.of(context)?.setLocale(locale);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
        PopupMenuItem<Locale>(
          value: const Locale('en'),
          child: Row(
            children: [
              if (currentLocale.languageCode == 'en')
                const Icon(
                  Icons.check,
                  color: Color(0xFF4CAF50),
                  size: 20,
                ),
              if (currentLocale.languageCode == 'en')
                const SizedBox(width: 8),
              const Icon(
                Icons.language,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(l10n.english),
            ],
          ),
        ),
        PopupMenuItem<Locale>(
          value: const Locale('ar'),
          child: Row(
            children: [
              if (currentLocale.languageCode == 'ar')
                const Icon(
                  Icons.check,
                  color: Color(0xFF4CAF50),
                  size: 20,
                ),
              if (currentLocale.languageCode == 'ar')
                const SizedBox(width: 8),
              const Icon(
                Icons.language,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(l10n.arabic),
            ],
          ),
        ),
      ],
    );
  }
}