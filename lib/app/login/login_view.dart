import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/router/route_paths.dart';
import '../../core/widget/base_widget.dart';
import 'login_view_model.dart';
import 'widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(authenticationService: Provider.of(context)),
      child: LoginHeader(controller: _controller),
      builder: (context, model, child) => Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          child,
          model.busy
              ? CircularProgressIndicator()
              : FlatButton(
                  color: Colors.white,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () async {
                    var loginSuccess = await model.login(_controller.text);
                    if (loginSuccess) {
                      Navigator.pushNamed(context, RoutePaths.Home);
                    }
                  },
                )
        ],
      )),
    );
  }
}
