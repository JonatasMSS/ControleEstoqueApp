// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DataByDay extends StatelessWidget {
  final String? title;
  final List<Widget>? dataChildrens;

  const DataByDay({
    Key? key,
    this.title,
    this.dataChildrens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 18),
      title: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 2),
          ),
        ),
        child: Text(
          title ?? 'NO DATA',
          style: TextStyle(
            color: Color.fromARGB(255, 97, 88, 88),
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      children: dataChildrens ?? [],
    );
  }
}
