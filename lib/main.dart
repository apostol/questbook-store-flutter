import 'package:basic/data/provider/preferences_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:basic/app/app.dart';
import 'package:basic/data/bloc/application/application_observer.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesProvider.instance.waitInit;
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = ApplicationObserver();
  initializeDateFormatting().then((_) => runApp(App()));
}
