import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:microzaim/src/data/models/calculation/calculation_model.dart';
import 'package:microzaim/src/data/models/debt/debt_model.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';

import 'src/internal/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveDatabase();
  runApp(const Application());
}

Future initHiveDatabase() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LoanModelAdapter());
  Hive.registerAdapter(CalculationModelAdapter());
  Hive.registerAdapter(DebtModelAdapter());
  await Hive.openBox<LoanModel>('loan_box');
  await Hive.openBox<DebtModel>('debt_box');
}
