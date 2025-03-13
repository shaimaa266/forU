

import 'package:flutter/material.dart';
import 'package:untitled1/core/helpers/local_storage.dart';
import 'package:untitled1/core/shared/customSnackBar.dart';
import 'package:untitled1/features/auth/data/models/register_model.dart';

import '../../../../core/routing/routes.dart';

class RegisterRepo{
  static Future<List<Map<String, dynamic>>> getUsersByEmail(String email) async {
    final db = await DataBaseHelper().db;
    final result= await db!.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result;
  }

  static Future<void> register(RegisterModel registerInputDataModel,context,) async {
    await DataBaseHelper().insert(
        values: registerInputDataModel.toJson(), table: 'users'
    ).then((value){
      customSnackBar(context,'Success Register');
      Navigator.pushNamedAndRemoveUntil(context, Routes.layoutView,(route) => false);
    }).catchError((error){
      customSnackBar(context, 'Failed to register,please try again');
    });
  }
}