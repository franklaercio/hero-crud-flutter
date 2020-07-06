import 'package:flutter/material.dart';
import 'package:hero_crud/models/user.dart';
import 'package:hero_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:hero_crud/provider/users.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: AssetImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(
        user.name,
        style: TextStyle(fontFamily: 'BangersRegular'),
      ),
      subtitle: Text(
        user.email,
        style: TextStyle(fontFamily: 'RobotoItalic'),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
            ),
            IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        'Delete Hero',
                        style: TextStyle(fontFamily: 'BangersRegular'),
                      ),
                      content: Text(
                        'Are you sure?',
                        style: TextStyle(fontFamily: 'BangersRegular'),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text(
                            'No',
                            style: TextStyle(fontFamily: 'BangersRegular'),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Provider.of<Users>(context, listen: false)
                                .remove(user);
                            Navigator.of(context).pop(true);
                          },
                          child: Text(
                            'Yes',
                            style: TextStyle(fontFamily: 'BangersRegular'),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
