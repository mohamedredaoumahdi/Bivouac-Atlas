import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of all supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  // Common
  String get appName;
  String get welcome;
  String get next;
  String get previous;
  String get skip;
  String get getStarted;
  String get continueText;
  String get cancel;
  String get ok;
  String get close;
  String get english;
  String get arabic;
  String get language;
  String get changeLanguage;

  // Onboarding
  String get onboardingTitle1;
  String get onboardingDesc1;
  String get onboardingTitle2;
  String get onboardingDesc2;
  String get onboardingTitle3;
  String get onboardingDesc3;
  String get onboardingTitle4;
  String get onboardingDesc4;

  // Activities
  String get chooseYourActivity;
  String get selectYourAdventure;
  String get availableActivities;
  String get activitiesDescription;
  String get tapToSelect;
  String get confirmSelection;
  String get pricePerPerson;
  String get continueToAccommodation;

  // Activity Names
  String get waterfallHike;
  String get tajineCooking;
  String get villageTour;
  String get mountainTrekking;
  String get lakeExcursion;
  String get starGazing;
  String get donkeyRide;
  String get handicraftWorkshop;
  String get forestPicnic;
  String get caveExploration;

  // Activity Descriptions
  String get waterfallHikeDesc;
  String get tajineCookingDesc;
  String get villageTourDesc;
  String get mountainTrekkingDesc;
  String get lakeExcursionDesc;
  String get starGazingDesc;
  String get donkeyRideDesc;
  String get handicraftWorkshopDesc;
  String get forestPicnicDesc;
  String get caveExplorationDesc;

  // Accommodation
  String get chooseAccommodation;
  String get selectedActivity;
  String get cabins;
  String get tents;
  String get perNight;
  String get available;
  String get accommodationNotice;
  String get continueWith;
  String get selected;

  // Accommodation Names
  String get panoramicCabin;
  String get familyCabin;
  String get ecoNatureCabin;
  String get traditionalBerberTent;
  String get comfortTent;

  // Accommodation Descriptions
  String get panoramicCabinDesc;
  String get familyCabinDesc;
  String get ecoNatureCabinDesc;
  String get traditionalBerberTentDesc;
  String get comfortTentDesc;

  // Booking
  String get completeBooking;
  String get bookingSummary;
  String get chooseTripType;
  String get personalInformation;
  String get stayDetails;
  String get fullName;
  String get emailAddress;
  String get phoneNumber;
  String get checkInDate;
  String get checkOutDate;
  String get adults;
  String get children;
  String get specialRequests;
  String get specialRequestsHint;
  String get completeBookingButton;
  String get termsNotice;
  String get required;
  String get pleaseEnterName;
  String get pleaseEnterEmail;
  String get pleaseEnterPhone;
  String get pleaseEnterValidEmail;
  String get pleaseSelectTripType;

  // Trip Types
  String get luxury;
  String get moderate;
  String get budget;
  String get luxuryDesc;
  String get moderateDesc;
  String get budgetDesc;

  // Confirmation
  String get bookingConfirmed;
  String get thankYouForBooking;
  String get confirmationEmailSent;
  String get returnToHome;

  // Errors and Messages
  String get error;
  String get success;
  String get loading;
  String get noInternetConnection;
  String get tryAgain;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(_lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}

AppLocalizations _lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue on GitHub with a '
    'reproducible sample app and the gen-l10n configuration that was used.'
  );
}