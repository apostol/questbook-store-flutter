import 'package:basic/app/screen/chats.dart';
import 'package:basic/app/screen/notifications.dart';
import 'package:basic/app/widget/search/search_modal_bottom_sheet.dart';
import 'package:basic/data/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends AppBar {
  AppBarWidget()
      : super(
            iconTheme: IconThemeData(color: Colors.deepPurple),
            elevation: 0,
            backgroundColor: Colors.white10,
            leading: Builder(
                builder: (BuildContext context) => IconButton(
                      padding: const EdgeInsets.all(12.0),
                      icon: Icon(Icons.menu),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    )),
            actions: <Widget>[
              Builder(builder: (BuildContext context) {
                return IconButton(
                    icon: Icon(Icons.search),
                    tooltip: "Search",
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return SearchModalBottomSheet();
                          });
                    });
              }),
              Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.chat_outlined),
                  tooltip: "Messages",
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatsPage(),
                    ),
                  ),
                );
              }),
              Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.notifications_outlined),
                  tooltip: "Notifications",
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationsPage(),
                    ),
                  ),
                );
              }),
              Builder(builder: (BuildContext context) {
                return IconButton(
                  padding: const EdgeInsets.all(12.0),
                  icon: CircleAvatar(
                    backgroundImage: NetworkImage(context
                            .read<AuthenticationBloc>()
                            .state
                            .profile!
                            .photo ??
                        'https://cdn.clipart.email/93ce84c4f719bd9a234fb92ab331bec4_frisco-specialty-clinic-vail-health_480-480.png'),
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              }),
            ]);
}
