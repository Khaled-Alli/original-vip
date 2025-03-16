import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalServices {

  Future<Box> openBox({ required String boxName}) async {
    return await Hive.openBox(boxName);
  }

  Future<void> putData({required String boxName, required String key,required  dynamic value}) async {
    final box = await openBox(boxName:  boxName);
    await box.put(key, value);
  }

  Future<dynamic> getData({required String boxName, required String key}) async{
    final box = await openBox(boxName:  boxName);
    box.toMap().map(
          (k, e) => MapEntry(
        k.toString(),
        Map<String, dynamic>.from(e),
      ),
    );
    return box.get(key) ;
  }

  Future<void> deleteData({required String boxName, required String key}) async {
    final box = await openBox(boxName: boxName);
    await box.delete(key);
  }

  Future<void> closeBox({required String boxName}) async {
    final box = await openBox(boxName: boxName);
    await box.close();
  }
}
