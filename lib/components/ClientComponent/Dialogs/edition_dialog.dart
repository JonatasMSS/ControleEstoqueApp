// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:genilson_app/main.dart';
import 'package:get/get.dart';

import 'package:genilson_app/components/DropDownInputC/DropDownInputC.dart';
import 'package:genilson_app/database/ObjectBox.dart';
import 'package:genilson_app/database/eventsBox.dart';
import 'package:genilson_app/models/ClientModel/ClientModel.dart';

import '../../InputFormComponent/InputFormComponent.dart';
import '../../SimpleButtonC/SimpleButtonC.dart';

class EditionDialog extends StatefulWidget {
  ClientModel? cliente;
  ObjectBox? objectBox;
  EditionDialog({
    Key? key,
    this.cliente,
    this.objectBox,
  }) : super(key: key);

  @override
  State<EditionDialog> createState() => _EditionDialogState();
}

class _EditionDialogState extends State<EditionDialog> {
  late TextEditingController clientNameController;
  late TextEditingController clientNumberController;
  late String? clientDateController;
  late EventsBox eventsBox;

  @override
  void initState() {
    clientDateController = widget.cliente?.date;
    clientNameController = TextEditingController(text: widget.cliente?.name);
    clientNumberController =
        TextEditingController(text: widget.cliente?.number.toString());
    eventsBox = EventsBox(boxDatabase: objectBox);
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
              onClick: () async {
                final ClientModel newClient = ClientModel(
                  id: widget.cliente!.id,
                  name: clientNameController.text.toString(),
                  number: int.parse(clientNumberController.text),
                  date: clientDateController ?? '',
                );

                await eventsBox.addClientToObjectBox(newClient);

                setState(() {
                  widget.cliente = newClient;
                });
                Get.back(result: true);
              },
            ),
            SimpleButtonC(
              text: 'Cancelar',
              onClick: () => Get.back(result: false),
            )
          ],
        ),
      ],
    );
  }
}
