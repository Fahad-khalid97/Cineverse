// dart format width=80
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
import 'package:cineverse/core/platform/device_info.dart' as _i277;
import 'package:cineverse/core/routes/app_router.dart' as _i162;
import 'package:cineverse/data/datasource/remote/account_api.dart' as _i926;
import 'package:cineverse/data/datasource/remote/auth_api.dart' as _i1072;
import 'package:cineverse/data/datasource/remote/configuration_api.dart'
    as _i494;
import 'package:cineverse/data/datasource/remote/media_api.dart' as _i654;
import 'package:cineverse/data/datasource/remote/search_api.dart' as _i856;
import 'package:cineverse/data/repo/account_repo.dart' as _i944;
import 'package:cineverse/data/repo/auth_repo.dart' as _i699;
import 'package:cineverse/data/repo/configuration_repo.dart' as _i1049;
import 'package:cineverse/data/repo/media_repo.dart' as _i262;
import 'package:cineverse/data/repo/search_repo.dart' as _i518;
import 'package:cineverse/features/auth/login/bloc/login_cubit.dart' as _i487;
import 'package:cineverse/features/movie/home/bloc/home/home_cubit.dart'
    as _i1051;
import 'package:cineverse/features/movie/movie_details/bloc/movie_detail/movie_detail_cubit.dart'
    as _i461;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i461.MovieDetailCubit>(() => _i461.MovieDetailCubit());
    gh.factory<_i1051.HomeCubit>(() => _i1051.HomeCubit());
    gh.lazySingleton<_i277.DeviceInfoService>(() => _i277.DeviceInfoService());
    gh.lazySingleton<_i152.AuthInterceptor>(() => _i152.AuthInterceptor());
    gh.lazySingleton<_i113.CacheInterceptor>(() => _i113.CacheInterceptor());
    gh.lazySingleton<_i162.AppRouter>(() => _i162.AppRouter());
    gh.factory<_i1072.AuthAPI>(() => _i1072.AuthAPI(gh<_i361.Dio>()));
    gh.factory<_i654.MediaAPI>(() => _i654.MediaAPI(gh<_i361.Dio>()));
    gh.factory<_i926.AccountAPI>(() => _i926.AccountAPI(gh<_i361.Dio>()));
    gh.factory<_i494.ConfigurationAPI>(
      () => _i494.ConfigurationAPI(gh<_i361.Dio>()),
    );
    gh.factory<_i856.SearchAPI>(() => _i856.SearchAPI(gh<_i361.Dio>()));
    gh.lazySingleton<_i944.AccountRepo>(
      () => _i944.AccountRepo(gh<_i926.AccountAPI>()),
    );
    gh.factory<_i699.AuthRepo>(() => _i699.AuthRepo(gh<_i1072.AuthAPI>()));
    gh.factory<_i487.LoginCubit>(() => _i487.LoginCubit(gh<_i699.AuthRepo>()));
    gh.lazySingleton<_i518.SearchRepo>(
      () => _i518.SearchRepo(gh<_i856.SearchAPI>()),
    );
    gh.lazySingleton<_i61.DioClient>(
      () => _i61.DioClient(
        gh<_i152.AuthInterceptor>(),
        gh<_i113.CacheInterceptor>(),
      ),
    );
    gh.lazySingleton<_i262.MediaRepo>(
      () => _i262.MediaRepo(gh<_i654.MediaAPI>()),
    );
    gh.lazySingleton<_i1049.ConfigurationRepo>(
      () => _i1049.ConfigurationRepo(gh<_i494.ConfigurationAPI>()),
    );
    return this;
  }
}
