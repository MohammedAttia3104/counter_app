import 'package:counter_app/data/cache_helper/cache_helper.dart';

class Repository {
  final DataSource cacheHelper;

  Repository(this.cacheHelper);

  int getCounterValue() {
    try {
      return cacheHelper.getCounter();
    } catch (e) {
      throw "an error occurred";
    }
  }

  Future<int> incrementCounter() async {
    await cacheHelper.incrementValue();
    return cacheHelper.getCounter();
  }

  Future<int> decrementCounter() async {
    await cacheHelper.decrementValue();
    return cacheHelper.getCounter();
  }
}
