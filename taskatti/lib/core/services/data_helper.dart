import 'package:hive/hive.dart';

class DataHelper {
  static late Box username;
  static String kname = 'name';
  static String kimage = 'image';
  static String isupload = 'isupload';

  static init() async {
    await Hive.openBox('username');
    username = Hive.box('username');
  }

  static putdata(String key, dynamic value) {
    username.put(key, value);
  }

  static getdata(String key) {
    return username.get(key);
  }

  static putuserdata(String name, String image) {
    putdata(kname, name);
    putdata(kimage, image);
    putdata(isupload, true);
  }
}
