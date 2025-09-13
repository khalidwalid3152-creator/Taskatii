import 'package:hive/hive.dart';
import 'package:taskatti/core/model/model_task.dart';

class DataHelper {
  static late Box username;
  static late Box<ModelTask> taskbox;

  static String kname = 'name';
  static String kimage = 'image';
  static String isupload = 'isupload';

  static init() async {
    Hive.registerAdapter<ModelTask>(ModelTaskAdapter());
    username = await Hive.openBox('username');
    taskbox = await Hive.openBox<ModelTask>('taskbox');
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

  static puttask(String key, ModelTask value) {
    taskbox.put(key, value);
  }

  static ModelTask? gettask(String key) {
    return taskbox.get(key);
  }
}
