import 'package:basic/app/screen/page/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: Center(
        child: BlocBuilder<SettingsCubit, int>(
          builder: (context, state) {
            return Text('Страница находится в разработке.', style: textTheme.bodyText1);
          },
        ),
      ),
    );
  }
}

