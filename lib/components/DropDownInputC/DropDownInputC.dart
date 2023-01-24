// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DropDownInputC extends StatefulWidget {
  final String? dataController;
  final Function(String?)? onDataChange;
  const DropDownInputC({
    Key? key,
    this.dataController,
    this.onDataChange,
  }) : super(key: key);

  @override
  State<DropDownInputC> createState() => _DropDownInputCState();
}

class _DropDownInputCState extends State<DropDownInputC> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Dia da semana",
            textScaleFactor: 1.8,
          ),
          DropdownButton<String>(
            isExpanded: true,
            value: widget.dataController,

            // isDense: true,
            hint: const Text('Informe o dia de atendimento'),
            items: const [
              DropdownMenuItem(
                value: 'segunda',
                child: Text('Segunda'),
              ),
              DropdownMenuItem(
                value: 'terca',
                child: Text('Terça'),
              ),
              DropdownMenuItem(
                value: 'quarta',
                child: Text('Quarta'),
              ),
              DropdownMenuItem(
                value: 'quinta',
                child: Text('Quinta'),
              ),
              DropdownMenuItem(
                value: 'sexta',
                child: Text('Sexta'),
              ),
            ],
            onChanged: widget.onDataChange,
          ),
        ],
      ),
    );
  }
}
