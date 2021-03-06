import 'package:flutter/material.dart';
import 'package:hero_crud/components/user.tile.dart';
import 'package:hero_crud/provider/users.dart';
import 'package:hero_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Hero App',
            style: TextStyle(fontFamily: 'BangersRegular', fontSize: 30),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (context, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
