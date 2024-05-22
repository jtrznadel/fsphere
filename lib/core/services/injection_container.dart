import 'package:fsphere/features/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:fsphere/features/on_boarding/data/repos/on_boarding_repo_impl.dart';
import 'package:fsphere/features/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:fsphere/features/on_boarding/domain/usecases/is_first_launch.dart';
import 'package:fsphere/features/on_boarding/domain/usecases/set_first_launch.dart';
import 'package:fsphere/features/on_boarding/presentation/cubit/cubit/on_boarding_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerFactory(
      () => OnBoardingCubit(
        setFirstLaunch: sl(),
        isFirstLaunch: sl(),
      ),
    )
    ..registerLazySingleton(() => SetFirstLaunch(sl()))
    ..registerLazySingleton(() => IsFirstLaunch(sl()))
    ..registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl(sl()))
    ..registerLazySingleton<OnBoardingLocalDataSource>(
        () => OnBoardingLocalDataSourceImpl(sl()))
    ..registerLazySingleton(() => prefs);
}
