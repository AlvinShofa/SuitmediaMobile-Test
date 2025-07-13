import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  String _loggedInName = '';
  User? _selectedUser;
  final List<User> _users = [];
  int _page = 1;
  bool _hasMore = true;
  bool _loading = false;
  bool _refreshing = false;

  String get loggedInName => _loggedInName;
  User? get selectedUser => _selectedUser;
  List<User> get users => _users;
  bool get loading => _loading;
  bool get refreshing => _refreshing;
  bool get hasMore => _hasMore;

  void setLoggedInName(String name) {
    _loggedInName = name;
    notifyListeners();
  }

  void selectUser(User user) {
    _selectedUser = user;
    notifyListeners();
  }

  Future<void> fetchUsers({bool refresh = false}) async {
    if (_loading) return;
    if (!_hasMore && !refresh) return;

    if (refresh) {
      _refreshing = true;
      _page = 1;
      _hasMore = true;
    } else {
      _loading = true;
    }
    notifyListeners();

    final res = await http.get(
      Uri.parse('https://reqres.in/api/users?page=$_page&per_page=6'),
      headers: {
        'x-api-key': 'reqres-free-v1',
      },
    );

    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      final List<User> fetched =
          (data['data'] as List).map((e) => User.fromJson(e)).toList();

      if (refresh) _users.clear();
      _users.addAll(fetched);

      _page++;
      _hasMore = fetched.isNotEmpty;
    }
    _loading = false;
    _refreshing = false;
    notifyListeners();
  }
}
