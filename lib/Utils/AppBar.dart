import 'package:flutter/material.dart';

import '../routes.dart';

AppBar getAppBar(context) {
  return AppBar(
        titleSpacing: 0.0,
        title: InkWell(
            child: Text(
              'Dodhi',
              style: TextStyle(
                  fontFamily: 'Nunito Bold', fontStyle: FontStyle.italic),
            ),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(Routes.HOME_PAGE,
                  (Route route) => route.settings.name == Routes.HOME_PAGE);
            }),
      );
}