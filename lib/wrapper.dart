import 'package:andre_house/authenticate/authenticate.dart';

import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // return either the Home or Authenticate widget
    return Authenticate();

  }
}