import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:cineverse/core/api/api_constants.dart';
import 'package:cineverse/data/models/configuration/language_model.dart';
import 'package:cineverse/data/models/configuration/country_model.dart';
import 'package:cineverse/data/models/configuration/timezone_model.dart';

import '../../models/configuration/configuration_model.dart';

part 'configuration_api.g.dart';

@RestApi()
abstract class ConfigurationAPI {
  factory ConfigurationAPI(Dio dio, {String? baseUrl}) = _ConfigurationAPI;

  @GET(ApiConstants.configuration)
  Future<ConfigurationModel> getApiConfiguration();

  @GET(ApiConstants.configurationLanguages)
  Future<List<LanguageModel>> getLanguages();

  @GET(ApiConstants.configurationCountries)
  Future<List<CountryModel>> getCountries();

  @GET(ApiConstants.configurationTimezones)
  Future<List<TimezoneModel>> getTimezones();
}
