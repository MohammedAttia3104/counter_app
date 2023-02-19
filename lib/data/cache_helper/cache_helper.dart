import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper  {
  SharedPreferences? prefs;
   late int counterValue ;

  CacheHelper(this.prefs, counterValue);

//static init .....
  void setCounter() async {
    prefs = await SharedPreferences.getInstance();
    prefs?.setInt('counter', counterValue);
  }

  getCounter() async {
    prefs = await SharedPreferences.getInstance();
    int counterValue = prefs?.getInt('counter') ?? 0;
    return counterValue;
  }

  Future<bool> incrementValue()async{
    return prefs!.setInt('counter', counterValue+1);
  }

  Future<bool> decrementValue()async{
    return prefs!.setInt('counter', counterValue-1);
  }

}
