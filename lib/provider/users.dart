import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hero_crud/data/dummy_users.dart';
import 'package:hero_crud/models/user.dart';

class Users with ChangeNotifier {
  Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
          user.id,
          (_) => User(
              name: user.name, email: user.email, avatarUrl: user.avatarUrl));
    } else {
      final String id = Random().nextDouble().toString();

      _items.putIfAbsent(
          id,
          () => User(
              name: user.name, email: user.email, avatarUrl: user.avatarUrl));
    }

    //add or alter
    notifyListeners();
  }

  void remove(User user) {
    print(user);
    print(user.id);
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
      print('Apagando');
    } else {
      print('Não apagou');
    }
  }
}
