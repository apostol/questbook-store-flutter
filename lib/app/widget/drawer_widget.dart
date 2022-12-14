import 'package:basic/app/screen/account.dart';
import 'package:basic/app/screen/blog.dart';
import 'package:basic/app/screen/genres.dart';
import 'package:basic/app/screen/page/artwork_filter_page.dart';
import 'package:basic/app/screen/page/asset_filter_page.dart';
import 'package:basic/app/screen/page/book_filter_page.dart';
import 'package:basic/app/screen/page/contest_filter_page.dart';
import 'package:basic/app/screen/page/user_filter_page.dart';
import 'package:basic/app/screen/search.dart';
import 'package:basic/app/screen/settings.dart';
import 'package:basic/data/bloc/profile/profile_bloc.dart';
import 'package:basic/data/models/artwork_filter_model.dart';
import 'package:basic/data/models/asset_filter_model.dart';
import 'package:basic/data/models/book_filter_model.dart';
import 'package:basic/data/models/contest_filter_model.dart';
import 'package:basic/data/models/user_filter_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';

class DrawerWidget extends Drawer {
  Widget build(BuildContext context) {
    final client = BlocProvider.of<ProfileBloc>(context).state.profile;
    return Drawer(
      child: ListView(
        children: <Widget>[
          // UserAccountsDrawerHeader(
          //   decoration: BoxDecoration(
          //     color: Colors.deepPurple[900],
          //   ),
          //   accountName: Text(client.nickName),
          //   accountEmail: Text(client.email),
          //   currentAccountPicture: CircleAvatar(
          //     backgroundImage: NetworkImage(client.photo)
          //   ),
          //   onDetailsPressed: () {},
          // ),
          ListTile(
            title: TextButton(
                child: Text('QuestBook.Today', textScaleFactor: 1.5),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/home')),
            trailing: IconButton(
                icon: Icon(Icons.share),
                onPressed: () =>
                    Share.share("http://itcube.online/itcube.apk")),
            tileColor: Colors.grey,
          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('?????? ????????????????????'),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    BookFilterPage(filter: BookFilterModel.MY_LIBRARY),
              ),
            ),
          ),
          const Divider(
            height: 4,
            thickness: 2,
            indent: 25,
            endIndent: 25,
          ),
          ExpansionTile(
            leading: Icon(Icons.book),
            title: Text('????????????????????????'),
            expandedAlignment: Alignment.centerRight,
            childrenPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            children: [
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('????????????????????'),
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BookFilterPage(filter: BookFilterModel.POPULAR),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.whatshot),
                title: Text('??????????????'),
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BookFilterPage(filter: BookFilterModel.NEW),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.local_offer),
                title: Text('????????????'),
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BookFilterPage(filter: BookFilterModel.SALES),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.campaign),
                title: Text('??????????????????????????'),
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BookFilterPage(filter: BookFilterModel.RECOMMENDED),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.collections_bookmark),
                title: Text('???????????? ???????????? ????????????'),
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GenresPage(),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: Text('?????????????????????? ??????????'),
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 4,
            thickness: 2,
            indent: 25,
            endIndent: 25,
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('????????????????????'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlogPage(),
              ),
            ),
          ),
          const Divider(
            height: 4,
            thickness: 2,
            indent: 25,
            endIndent: 25,
          ),
          ExpansionTile(
            leading: Icon(Icons.people),
            title: Text('????????????????????'),
            expandedAlignment: Alignment.centerRight,
            childrenPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            children: [
              ListTile(
                leading: Icon(Icons.star),
                title: Text('?????? ??????????????'),
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        UserFilterPage(filter: UserFilterModel.AUTHOR_TOP),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.receipt),
                title: Text('?????? ??????????????????????????'),
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        UserFilterPage(filter: UserFilterModel.USER_TOP),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.picture_in_picture),
                title: Text('??????????????????????'),
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ArtworkFilterPage(filter: ArtworkFilterModel.ALL),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.present_to_all),
                title: Text('????????????????'),
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AssetFilterPage(filter: AssetFilterModel.ALL),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 4,
            thickness: 2,
            indent: 25,
            endIndent: 25,
          ),
          ListTile(
            leading: Icon(Icons.lightbulb),
            title: Text('????????????????'),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ContestFilterPage(filter: ContestFilterModel.ALL),
              ),
            ),
          ),
          const Divider(
            height: 4,
            thickness: 2,
            indent: 25,
            endIndent: 25,
          ),
          ListTile(
            leading: Icon(Icons.build),
            title: Text('?????????? ??????????????????'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsPage(),
              ),
            ),
          ),
          const Divider(
            height: 4,
            thickness: 2,
            indent: 25,
            endIndent: 25,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('???????????? ??????????????'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AccountPage(),
              ),
            ),
          ),
          const Divider(
            height: 4,
            thickness: 2,
            indent: 25,
            endIndent: 25,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('??????????'),
            onTap: () => {},
          ),
          /*
          ListTile(
            leading: Icon(Icons.person),
            title: Text("??????????????"),
            subtitle: Text("???????????? ????????????"),
            onTap: () async {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.person_pin_outlined),
            title: Text("??????????????"),
            subtitle: Text("???????????????????????? ??????????????"),
            onTap: () async {
              Navigator.pushNamed(context, '/card');
            },
          ),
          ListTile(
            leading: Icon(Icons.person_pin_outlined),
            title: Text("??????????????"),
            subtitle: Text("???????????????????? ??????????????"),
            onTap: () async {
              Navigator.pushNamed(context, '/gratitude');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("??????????????????"),
            subtitle: Text("?????????????????? ????????????????????"),
            onTap: () async {
              Navigator.pushNamed(context, '/settings');
            },
          ),

          ListTile(
            leading: Icon(Icons.share),
            title: Text("????????????????????"),
            subtitle: Text("???????????????????? ??????????????..."),
            onTap: () async {
              final PermissionStatus permissionStatus = await _getPermission();
              if (permissionStatus == PermissionStatus.granted) {
                Navigator.pushNamed(context, '/contacts');
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: Text('Permissions error'),
                      content: Text('Please enable contacts access '
                          'permission in system settings'),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text('OK'),
                          onPressed: () => Navigator.of(context).pop(),
                        )
                      ],
                    ));
              }
            }
          ),
          Share.share(widget.model.url);
           */
          // ListTile(
          //     leading: Icon(Icons.share),
          //     title: Text("????????????????????"),
          //     subtitle: Text("???????????????????? ??????????????..."),
          //     onTap: ()=>Share.share("http://itcube.online/itcube.apk")
          // ),
          /*
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("??????????"),
            subtitle: Text("?????????? ???? ??????????????"),
            onTap: () => context.read<AuthenticationBloc>().add(AuthenticationLogoutRequest()),
          ),
           */
          /*
          ListTile(
            leading: Icon(Icons.developer_mode),
            title: Text("?? ??????????????????"),
            subtitle: Text("?????? ?? ?????? ??????????????????????????"),
            onTap: () async {
              Navigator.pushNamed(context, '/about');
            },
          ),
           */
        ],
      ),
    );
  }
}
