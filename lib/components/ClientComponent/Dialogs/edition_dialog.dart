// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:genilson_app/components/DropDownInputC/DropDownInputC.dart';
import 'package:genilson_app/models/ClientModel/ClientModel.dart';

import '../../InputFormComponent/InputFormComponent.dart';
import '../../SimpleButtonC/SimpleButtonC.dart';

class EditionDialog extends StatefulWidget {
  final ClientModel? cliente;

  const EditionDialog({
    Key? key,
    this.cliente,
  }) : super(key: key);

  @override
  State<EditionDialog> createState() => _EditionDialogState();
}

class _EditionDialogState extends State<EditionDialog> {
  late TextEditingController clientNameController;
  late TextEditingController clientNumberController;
  late String? clientDateController;

  @override
  void initState() {
    clientDateController = widget.cliente?.date;
    clientNameController = TextEditingController(text: widget.cliente?.name);
    clientNumberController =
        TextEditingController(text: widget.cliente?.number.toString());

    super.initState();
  }

  void hChangeDateData(String? value) {
    setState(() {
      clientDateController = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: const EdgeInsets.all(0),
      title: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: Colors.amber,
        ),
        child: const Text(
          'Editar cliente',
          style: TextStyle(color: Colors.white),
        ),
      ),
      children: [
        const SizedBox(
          height: 10,
        ),
        InputFormComponent(
          titleForm: 'Nome do cliente',
          placeholder: 'Nome do cliente',
          controller: clientNameController,
        ),
        const SizedBox(
          height: 20,
        ),
        InputFormComponent(
          titleForm: 'Numero',
          placeholder: 'Numero do cliente',
          type: TextInputType.number,
          controller: clientNumberController,
        ),
        const SizedBox(
          height: 30,
        ),
        DropDownInputC(
          dataController: clientDateController,
          onDataChange: hChangeDateData,
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SimpleButtonC(
              primary: true,
              text: 'Confirmar',
              onClick: () => Navigator.pop(context),
            ),
            SimpleButtonC(
              text: 'Cancelar',
              onClick: () => Navigator.pop(context),
            )
          ],
        ),
      ],
    );
  }
}
