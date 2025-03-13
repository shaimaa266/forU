

import 'package:untitled1/core/helpers/local_storage.dart';
import 'package:untitled1/features/auth/data/models/login_model.dart';

class LoginRepo {
  static Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final db = await DataBaseHelper().db;
    final result = await db!.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty ? result.first : null;
  }

  static Future<String> getUserByEmailAndPassword(
      LoginModel loginRequestModel) async {
    final user = await getUserByEmail(loginRequestModel.email);
    if (user != null) {
      if (user['password'] == loginRequestModel.password) {
        return 'Success Login';
      }else{
        return 'Incorrect password';
      }
    }else{
      return 'Incorrect email or password';
    }

  }



}