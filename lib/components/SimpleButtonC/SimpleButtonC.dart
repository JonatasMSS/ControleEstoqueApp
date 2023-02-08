// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SimpleButtonC extends StatelessWidget {
  final String? text;
  final bool primary;
  final Function()? onClick;
  const SimpleButtonC({
    Key? key,
    this.text,
    this.primary = false,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return primary
        ? TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF6AFF79),
              padding: const EdgeInsets.all(8),
              minimumSize: const Size(120, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            onPressed: onClick,
            child: Text(
              text ?? 'NO DATA',
              style: const TextStyle(color: Colors.white),
            ),
          )
        : TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFFF4747),
              padding: const EdgeInsets.all(8),
              minimumSize: const Size(120, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            onPressed: onClick,
            child: Text(
              text ?? 'NO DATA',
              style: const TextStyle(color: Colors.white),
            ),
          );
  }
}
