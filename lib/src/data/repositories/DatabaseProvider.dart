import 'package:flutter/cupertino.dart';

import 'DatabaseHelper.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  DatabaseHelper get databaseHelper => _databaseHelper;
}