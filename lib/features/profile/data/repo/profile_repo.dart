
import 'package:untitled1/core/helpers/cache_helper.dart';
import 'package:untitled1/core/helpers/local_storage.dart';
import 'package:untitled1/features/auth/data/models/register_model.dart';

import '../../../../core/web_services/constants.dart';

class AccountEditingRepo {
  static Future<Map<String, dynamic>> getUserByEmail() async {
    final db = await DataBaseHelper().db;
    final result = await db!.query(
      'users',
      where: 'email = ?',
      whereArgs: [CacheHelper.getData(key: 'token')],
    );
    return result.first;
  }

  static Future<RegisterModel> fetchUserData() async {
    final user = await getUserByEmail();
    RegisterModel registerRequestModel =
    RegisterModel.fromJson(user);
    return registerRequestModel;
  }

  static Future updateUserData(
      {required String email, required String firstName, required String lastName}) async {
    final db = await DataBaseHelper().db;
    await db?.update('users',{
      'email':email,
      'firstName' :firstName,
      'lastName': lastName,
    }, where: 'email = ?',
        whereArgs: [email]);
  }
  static Future updatePassword(
      {required String password, required String confirmPassword}) async {
    final db = await DataBaseHelper().db;
    await db?.update('users',{
      'password':password,
      'confirmPassword' :confirmPassword,
    }, where: 'email = ?',
        whereArgs: [email]);
  }
}