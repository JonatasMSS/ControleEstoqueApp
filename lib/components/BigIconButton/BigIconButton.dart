// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BigIconButton extends StatelessWidget {
  final String? description;
  final String imageLocation;

  const BigIconButton({
    Key? key,
    this.description,
    required this.imageLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 150,
        maxHeight: 150,
      ),
      // width: 150,
      // height: 150,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFC6C6C6),
              blurRadius: 5,
              offset: Offset(1, 2),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageLocation,
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(description ?? "NO DATA"),
        ],
      ),
    );
  }
}
