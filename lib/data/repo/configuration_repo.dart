import 'package:cineverse/data/datasource/remote/configuration_api.dart';
import 'package:injectable/injectable.dart';

import '../models/configuration/configuration_model.dart';
import '../models/configuration/language_model.dart';
import '../models/configuration/country_model.dart';
import '../models/configuration/timezone_model.dart';

@lazySingleton
class ConfigurationRepo {
  final ConfigurationAPI _configurationAPI;

  ConfigurationRepo(this._configurationAPI);

  Future<ConfigurationModel> getApiConfiguration() async {
    return await _configurationAPI.getApiConfiguration();
  }

  Future<List<LanguageModel>> getLanguages() async {
    return await _configurationAPI.getLanguages();
  }

  Future<List<CountryModel>> getCountries() async {
    return await _configurationAPI.getCountries();
  }

  Future<List<TimezoneModel>> getTimezones() async {
    return await _configurationAPI.getTimezones();
  }
}
