// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavBarComponent extends AppBar {
  NavBarComponent({super.key, String? NavBarTitle})
      : super(
          title: Text(NavBarTitle ?? "NO DATA"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        );
}
