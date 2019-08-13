import 'package:flutter/material.dart';

import '../../core/enums/viewstate.dart';
import '../base/base_view.dart';
import 'login_model.dart';
import 'login_header.dart';

class LoginView extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              LoginHeader(
                controller: controller,
                validationMessage: model.errorMessage,
              ),
              model.state == ViewState.Busy
                  ? CircularProgressIndicator()
                  : FlatButton(
                      child:
                          Text('Login', style: TextStyle(color: Colors.black)),
                      color: Colors.white,
                      onPressed: () async {
                        var loginSuccess = await model.login(controller.text);
                        if (loginSuccess) {
                          Navigator.pushNamed(context, '/');
                        }
                      },
                    )
            ],
          ),
        );
      },
    );
  }
}
