// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputSearchComponent extends StatelessWidget {
  final TextEditingController? searchController;
  final String? hintText;
  final Function(bool)? onFocused;

  const InputSearchComponent({
    Key? key,
    this.searchController,
    this.hintText,
    this.onFocused,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: onFocused,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 180, 180, 180),
              blurRadius: 3,
              offset: Offset(2, 2),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: TextFormField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: const Icon(Icons.search),
            filled: true,
            contentPadding: const EdgeInsets.all(10),
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20),
            ),
            isCollapsed: true,
          ),
        ),
      ),
    );
  }
}
