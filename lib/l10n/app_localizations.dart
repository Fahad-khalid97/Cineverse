import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('es'),
    Locale('fr')
  ];

  /// Placeholder text for movie search input
  ///
  /// In en, this message translates to:
  /// **'Search for a movie'**
  String get searchForMovie;

  /// Text for add to watchlist success
  ///
  /// In en, this message translates to:
  /// **'Added to watchlist'**
  String get addToWatchlistSuccess;

  /// Text for add to favorites success
  ///
  /// In en, this message translates to:
  /// **'Added to favorites'**
  String get addToFavoritesSuccess;

  /// Text for app settings section
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get appSettings;

  /// Text for error section
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Text for enter username section
  ///
  /// In en, this message translates to:
  /// **'Enter your username'**
  String get enterYourUsername;

  /// Text for enter password section
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterYourPassword;

  /// Text for set language section
  ///
  /// In en, this message translates to:
  /// **'Set Language'**
  String get setLanguage;

  /// Text for set theme section
  ///
  /// In en, this message translates to:
  /// **'Set Theme'**
  String get setTheme;

  /// Text for watched movies section
  ///
  /// In en, this message translates to:
  /// **'Watched Movies'**
  String get watchedMovies;

  /// Text for now playing movies section
  ///
  /// In en, this message translates to:
  /// **'Now Playing Movies'**
  String get nowPlayingMovies;

  /// Text for upcoming movies section
  ///
  /// In en, this message translates to:
  /// **'Upcoming Movies'**
  String get upcomingMovies;

  /// Text for sign in button
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// Text for sign up button
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// Label for username field
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// Label for password field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Link text for password recovery
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// Text for login button
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Question asking if user is new
  ///
  /// In en, this message translates to:
  /// **'New User?'**
  String get newUser;

  /// Terms and privacy policy agreement text
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to the Terms of Use. Read our Privacy Policy.'**
  String get termsAgreement;

  /// Text for search function
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Text for filters button
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// Text for home navigation
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Text for TV shows category
  ///
  /// In en, this message translates to:
  /// **'TV Shows'**
  String get tvShows;

  /// Text for movies category
  ///
  /// In en, this message translates to:
  /// **'Movies'**
  String get movies;

  /// Text for personal list of saved content
  ///
  /// In en, this message translates to:
  /// **'My List'**
  String get myList;

  /// Text for popular movies section
  ///
  /// In en, this message translates to:
  /// **'Popular Movies'**
  String get popularMovies;

  /// Text for popular TV shows section
  ///
  /// In en, this message translates to:
  /// **'Popular TV Shows'**
  String get popularTVShows;

  /// Text for top rated movies section
  ///
  /// In en, this message translates to:
  /// **'Top Rated Movies'**
  String get topRatedMovies;

  /// Text for top rated TV shows section
  ///
  /// In en, this message translates to:
  /// **'Top Rated TV Shows'**
  String get topRatedTVShows;

  /// Text for reviews section
  ///
  /// In en, this message translates to:
  /// **'reviews'**
  String get reviews;

  /// Text for cast section
  ///
  /// In en, this message translates to:
  /// **'Cast'**
  String get cast;

  /// Text for crew section
  ///
  /// In en, this message translates to:
  /// **'Crew'**
  String get crew;

  /// Text for combined cast and crew section
  ///
  /// In en, this message translates to:
  /// **'Cast & Crew'**
  String get castAndCrew;

  /// Text for adding content to watchlist
  ///
  /// In en, this message translates to:
  /// **'Add to Watchlist'**
  String get addToWatchlist;

  /// Text for removing content from watchlist
  ///
  /// In en, this message translates to:
  /// **'Remove from Watchlist'**
  String get removeFromWatchlist;

  /// Text for profile section
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Text for favorites movies section
  ///
  /// In en, this message translates to:
  /// **'Favorites Movies'**
  String get favoritesMovies;

  /// Text for device information section
  ///
  /// In en, this message translates to:
  /// **'Device Information'**
  String get deviceInformation;

  /// Text for language section
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Text for device model information
  ///
  /// In en, this message translates to:
  /// **'Device Model'**
  String get deviceModel;

  /// Text for operating system version
  ///
  /// In en, this message translates to:
  /// **'OS Version'**
  String get osVersion;

  /// Text for available storage space information
  ///
  /// In en, this message translates to:
  /// **'Available Storage Space'**
  String get availableStorageSpace;

  /// Text for battery level information
  ///
  /// In en, this message translates to:
  /// **'Battery Level'**
  String get batteryLevel;

  /// Text for logout button
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Text for favorites TV shows section
  ///
  /// In en, this message translates to:
  /// **'Favorites TV Shows'**
  String get favoritesTVShows;

  /// Text for watched TV shows section
  ///
  /// In en, this message translates to:
  /// **'Watched TV Shows'**
  String get watchedTVShows;

  /// Text for movies information section
  ///
  /// In en, this message translates to:
  /// **'Movies Information'**
  String get moviesInformation;

  /// Text for TV shows information section
  ///
  /// In en, this message translates to:
  /// **'TV Shows Information'**
  String get tvShowsInformation;

  /// Text for no movies found section
  ///
  /// In en, this message translates to:
  /// **'No movies found'**
  String get noMoviesFound;

  /// Text for no TV shows found section
  ///
  /// In en, this message translates to:
  /// **'No TV shows found'**
  String get noTVShowsFound;

  /// Placeholder text for TV show search input
  ///
  /// In en, this message translates to:
  /// **'Search for a TV show'**
  String get searchForTvShow;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
