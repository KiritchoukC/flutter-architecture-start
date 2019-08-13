import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'router.dart';
import 'core/models/user.dart';
import 'core/services/authentication_service.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.controller(
      initialData: User.initial(),
      builder: (_) => locator<AuthenticationService>().userController,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: 'login',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
