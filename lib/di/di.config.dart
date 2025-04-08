// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cineverse/core/api/dio_client.dart' as _i61;
import 'package:cineverse/core/api/interceptors/auth_interceptor.dart' as _i152;
import 'package:cineverse/core/api/interceptors/cache_interceptor.dart'
    as _i113;
import 'package:cineverse/core/cache/cache_entry.dart' as _i993;
import 'package:cineverse/core/cache/cache_manager.dart' as _i58;
import 'package:cineverse/core/platform/device_info.dart' as _i277;
import 'package:cineverse/core/routes/app_router.dart' as _i162;
import 'package:cineverse/data/datasource/remote/configuration_api.dart'
    as _i494;
import 'package:cineverse/data/datasource/remote/media_api.dart' as _i654;
import 'package:cineverse/data/datasource/remote/search_api.dart' as _i856;
import 'package:cineverse/data/repo/account_repo.dart' as _i944;
import 'package:cineverse/data/repo/auth_repo.dart' as _i699;
import 'package:cineverse/data/repo/configuration_repo.dart' as _i1049;
import 'package:cineverse/data/repo/media_repo.dart' as _i262;
import 'package:cineverse/data/repo/search_repo.dart' as _i518;
import 'package:cineverse/features/account/profile_setting/api/account_api.dart'
    as _i289;
import 'package:cineverse/features/auth/login/api/auth_api.dart' as _i1018;
import 'package:cineverse/features/auth/login/bloc/login_cubit.dart' as _i487;
import 'package:cineverse/features/movie/home/bloc/home/home_cubit.dart'
    as _i1051;
import 'package:cineverse/features/movie/media_details/bloc/media_detail/media_detail_cubit.dart'
    as _i377;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i1051.HomeCubit>(() => _i1051.HomeCubit());
    gh.factory<_i377.MediaDetailCubit>(() => _i377.MediaDetailCubit());
    gh.lazySingleton<_i277.DeviceInfoService>(() => _i277.DeviceInfoService());
    gh.lazySingleton<_i152.AuthInterceptor>(() => _i152.AuthInterceptor());
    gh.lazySingleton<_i162.AppRouter>(() => _i162.AppRouter());
    gh.lazySingleton<_i113.CacheInterceptor>(
        () => _i113.CacheInterceptor(gh<_i58.CacheManager>()));
    gh.factory<_i993.CacheEntry>(() => _i993.CacheEntry(
          key: gh<String>(),
          value: gh<String>(),
          cachedAt: gh<DateTime>(),
          ttlSeconds: gh<int>(),
        ));
    gh.factory<_i289.AccountAPI>(() => _i289.AccountAPI(gh<_i361.Dio>()));
    gh.factory<_i654.MediaAPI>(() => _i654.MediaAPI(gh<_i361.Dio>()));
    gh.factory<_i494.ConfigurationAPI>(
        () => _i494.ConfigurationAPI(gh<_i361.Dio>()));
    gh.factory<_i856.SearchAPI>(() => _i856.SearchAPI(gh<_i361.Dio>()));
    gh.factory<_i1018.AuthAPI>(() => _i1018.AuthAPI(gh<_i361.Dio>()));
    gh.lazySingleton<_i518.SearchRepo>(
        () => _i518.SearchRepo(gh<_i856.SearchAPI>()));
    gh.lazySingleton<_i944.AccountRepo>(
        () => _i944.AccountRepo(gh<_i289.AccountAPI>()));
    gh.factory<_i699.AuthRepo>(() => _i699.AuthRepo(gh<_i1018.AuthAPI>()));
    gh.lazySingleton<_i61.DioClient>(() => _i61.DioClient(
          gh<_i152.AuthInterceptor>(),
          gh<_i113.CacheInterceptor>(),
        ));
    gh.lazySingleton<_i262.MediaRepo>(
        () => _i262.MediaRepo(gh<_i654.MediaAPI>()));
    gh.lazySingleton<_i1049.ConfigurationRepo>(
        () => _i1049.ConfigurationRepo(gh<_i494.ConfigurationAPI>()));
    gh.factory<_i487.LoginCubit>(() => _i487.LoginCubit(gh<_i699.AuthRepo>()));
    return this;
  }
}
