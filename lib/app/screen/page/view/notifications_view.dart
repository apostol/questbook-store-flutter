import 'package:basic/app/screen/page/cubit/about_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Новости и уведомления')),
      body: Center(
        child: BlocBuilder<AboutCubit, int>(
          builder: (context, state) {
            return Text('Страница находится в разработке.',
                style: textTheme.bodyText1);
          },
        ),
      ),
    );
  }
}
