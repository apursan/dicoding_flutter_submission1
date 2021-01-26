import 'package:dicoding_flutter_submission1/app/tabs/account/account.dart';
import 'package:dicoding_flutter_submission1/app/tabs/home/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            Home(),
            Account(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            labelPadding: const EdgeInsets.only(bottom: 10),
            labelStyle: TextStyle(fontSize: 16.0),
            indicatorColor: Colors.transparent,
            labelColor: theme.primaryColor,
            unselectedLabelColor: Colors.black54,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home, size: 28),
                text: 'Beranda',
              ),
              Tab(
                icon: Icon(Icons.person_outline, size: 28),
                text: 'Akun',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
