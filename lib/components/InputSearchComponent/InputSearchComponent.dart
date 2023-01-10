// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputSearchComponent extends StatefulWidget {
  final TextEditingController? searchController;
  final String? hintText;
  final Function(String)? onChangedFunction;

  const InputSearchComponent({
    Key? key,
    this.searchController,
    this.hintText,
    this.onChangedFunction,
  }) : super(key: key);

  @override
  State<InputSearchComponent> createState() => _InputSearchComponentState();
}

class _InputSearchComponentState extends State<InputSearchComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        onChanged: widget.onChangedFunction,
        controller: widget.searchController,
        decoration: InputDecoration(
          hintText: widget.hintText,
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
    );
  }
}
