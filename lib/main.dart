import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/config/bloc_obsever.dart';
import 'package:store_app/core/utils/injection.dart';

import 'store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await getItInit();
  runApp(const StoreApp());
}



