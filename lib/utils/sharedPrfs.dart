import 'package:shared_preferences/shared_preferences.dart';

final ID = "ID";
final LOGIN = "LOGIN";

Future setSharedPreference(key, data) async {
  SharedPreferences prfs = await SharedPreferences.getInstance();
  prfs.setString(key, data);
}

Future getSharedPreference(key) async {
  var prfs = await SharedPreferences.getInstance();
  var value = prfs.getString(key);
  return value;
}
