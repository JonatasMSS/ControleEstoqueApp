// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InputFormComponent extends StatelessWidget {
  final String? titleForm;
  final String? placeholder;
  final TextEditingController? controller;
  final TextInputType? type;
  final double fontSize;

  const InputFormComponent({
    Key? key,
    this.titleForm,
    this.placeholder,
    this.controller,
    this.type,
    this.fontSize = 1.8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleForm ?? 'NO DATA',
            textScaleFactor: fontSize,
          ),
          TextFormField(
            controller: controller,
            enableSuggestions: true,
            keyboardType: type,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              filled: true,
              hintStyle: const TextStyle(
                fontSize: 15,
              ),
              hintText: placeholder ?? 'NO DATA',
              fillColor: const Color(0xFFF4F4F4),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 137, 137, 137),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
