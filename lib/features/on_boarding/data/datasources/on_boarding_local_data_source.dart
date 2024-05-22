import 'package:fsphere/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnBoardingLocalDataSource {
  const OnBoardingLocalDataSource();

  Future<void> setFirstLaunch();
  Future<bool> isFirstLaunch();
}

const kFirstLaunchKey = 'first_launch';

class OnBoardingLocalDataSourceImpl extends OnBoardingLocalDataSource {
  const OnBoardingLocalDataSourceImpl(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<bool> isFirstLaunch() async {
    try {
      return _prefs.getBool(kFirstLaunchKey) ?? true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> setFirstLaunch() async {
    try {
      await _prefs.setBool(kFirstLaunchKey, false);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
