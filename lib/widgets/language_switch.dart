import 'package:flutter/material.dart';
import '../main.dart';
import '../l10n/app_localizations.dart';

class LanguageSwitch extends StatelessWidget {
  final bool isDarkBackground;
  
  const LanguageSwitch({
    super.key,
    this.isDarkBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = Localizations.localeOf(context);
    final iconColor = isDarkBackground ? Colors.white : const Color(0xFF4CAF50);
    
    return PopupMenuButton<Locale>(
      icon: Icon(
        Icons.language,
        color: iconColor,
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
                color: Color(0xFF757575),
              ),
              const SizedBox(width: 8),
              Text(
                l10n.english,
                style: const TextStyle(
                  color: Color(0xFF333333),
                ),
              ),
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
                color: Color(0xFF757575),
              ),
              const SizedBox(width: 8),
              Text(
                l10n.arabic,
                style: const TextStyle(
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}