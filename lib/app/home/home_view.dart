import 'package:flutter/material.dart';
import 'package:provider_architecutre/core/enums/viewstate.dart';

import '../base/base_view.dart';
import 'home_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      builder: (context, model, child) {
        return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: model.state == ViewState.Busy
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: Text('LOADED'),
                  ));
      },
    );
  }
}
