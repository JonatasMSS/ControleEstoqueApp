import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/ClientComponent/ClientComponent.dart';
import 'package:genilson_app/components/DataByDay/DataByDay.dart';
import 'package:genilson_app/components/DropDownInputC/DropDownInputC.dart';
import 'package:genilson_app/components/InputFormComponent/InputFormComponent.dart';
import 'package:genilson_app/components/NavBar/NavBarComponent.dart';
import 'package:genilson_app/components/SimpleButtonC/SimpleButtonC.dart';

class ClientesPage extends StatelessWidget {
  const ClientesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF6AFF79),
          onPressed: () => showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const ClientDialogAdd();
              }),
          child: const Icon(Icons.add),
        ),
        backgroundColor: const Color(0xFFE4E4E4),
        appBar: NavBarComponent(NavBarTitle: 'Meus Clientes'),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(
                height: 20,
              ),
              DataByDay(
                title: 'Terça-feira',
                dataChildrens: [
                  ClientComponent(),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              DataByDay(
                title: 'Quarta-feira',
                dataChildrens: [],
              ),
              SizedBox(
                height: 40,
              ),
              DataByDay(
                title: 'Quinta-feira',
                dataChildrens: [],
              ),
              SizedBox(
                height: 40,
              ),
              DataByDay(
                title: 'Sexta-feira',
                dataChildrens: [],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ));
  }
}

class ClientDialogAdd extends StatefulWidget {
  const ClientDialogAdd({super.key});

  @override
  State<ClientDialogAdd> createState() => _ClientDialogAddState();
}

class _ClientDialogAddState extends State<ClientDialogAdd> {
  String? _dateData;
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
        const InputFormComponent(
          titleForm: 'Nome do cliente',
          placeholder: 'Nome do cliente',
        ),
        const SizedBox(
          height: 20,
        ),
        const InputFormComponent(
          titleForm: 'Numero',
          placeholder: 'Numero do cliente',
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
