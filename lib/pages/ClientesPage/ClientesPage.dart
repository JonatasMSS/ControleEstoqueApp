// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:genilson_app/components/ClientComponent/ClientComponent.dart';
import 'package:genilson_app/components/DataByDay/DataByDay.dart';
import 'package:genilson_app/components/DropDownInputC/DropDownInputC.dart';
import 'package:genilson_app/components/InputFormComponent/InputFormComponent.dart';
import 'package:genilson_app/components/NavBar/NavBarComponent.dart';
import 'package:genilson_app/components/SimpleButtonC/SimpleButtonC.dart';
import 'package:genilson_app/database/ObjectBox.dart';
import 'package:genilson_app/database/eventsBox.dart';
import 'package:genilson_app/models/ClientModel/ClientModel.dart';

class ClientesPage extends StatefulWidget {
  ObjectBox objectBox;

  ClientesPage({
    Key? key,
    required this.objectBox,
  }) : super(key: key);

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  late EventsBox eventsBox;
  late List<ClientModel> clients;

  @override
  void initState() {
    eventsBox = EventsBox(boxDatabase: widget.objectBox);
    clients = eventsBox.listarClientes();
    print("INIT STATE");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF6AFF79),
          onPressed: () => showDialog(
              useRootNavigator: true,
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return ClientDialogAdd(
                  eventsDatabase: eventsBox,
                );
              }).then((value) {
            setState(() {
              clients = eventsBox.listarClientes();
            });
          }),
          child: const Icon(Icons.add),
        ),
        backgroundColor: const Color(0xFFE4E4E4),
        appBar: NavBarComponent(NavBarTitle: 'Meus Clientes'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              DataByDay(
                valueData: 'segunda',
                title: 'Segunda-feira',
                dataChildrens: clients,
                isChildrensEditable: true,
              ),
              const SizedBox(
                height: 20,
              ),
              DataByDay(
                valueData: 'terca',
                title: 'Terça-feira',
                dataChildrens: clients,
                isChildrensEditable: true,
              ),
              const SizedBox(
                height: 30,
              ),
              DataByDay(
                valueData: 'quarta',
                title: 'Quarta-feira',
                dataChildrens: clients,
                isChildrensEditable: true,
              ),
              const SizedBox(
                height: 30,
              ),
              DataByDay(
                valueData: 'quinta',
                title: 'Quinta-feira',
                dataChildrens: clients,
                isChildrensEditable: true,
              ),
              const SizedBox(
                height: 30,
              ),
              DataByDay(
                valueData: 'sexta',
                title: 'Sexta-feira',
                dataChildrens: clients,
                isChildrensEditable: true,
              ),
            ],
          ),
        ));
  }
}

class ClientDialogAdd extends StatefulWidget {
  final EventsBox eventsDatabase;

  ClientDialogAdd({
    Key? key,
    required this.eventsDatabase,
  }) : super(key: key);

  @override
  State<ClientDialogAdd> createState() => _ClientDialogAddState();
}

class _ClientDialogAddState extends State<ClientDialogAdd> {
  String? _dateData;

  final TextEditingController nome = TextEditingController();
  final TextEditingController numero = TextEditingController();

  void hChangeDateData(String? value) {
    setState(() {
      _dateData = value;
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
          color: Colors.blue,
        ),
        child: const Text(
          'Criar novo cliente',
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
          controller: nome,
        ),
        const SizedBox(
          height: 20,
        ),
        InputFormComponent(
          titleForm: 'Numero',
          placeholder: 'Numero do cliente',
          controller: numero,
          type: TextInputType.number,
        ),
        const SizedBox(
          height: 30,
        ),
        DropDownInputC(
          dataController: _dateData,
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
              onClick: () {
                final ClientModel newClient = ClientModel(
                  name: nome.text,
                  number: int.parse(numero.text),
                  date: _dateData!,
                );
                widget.eventsDatabase.addClientToObjectBox(newClient);

                Navigator.pop(context);
              },
            ),
            SimpleButtonC(
              text: 'Cancelar',
              onClick: () => Get.back(),
            )
          ],
        ),
      ],
    );
  }
}
