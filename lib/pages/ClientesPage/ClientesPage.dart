import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/ClientComponent/ClientComponent.dart';
import 'package:genilson_app/components/DataByDay/DataByDay.dart';
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
              DataByDay(
                title: 'Terça-feira',
                dataChildrens: [
                  ClientComponent(),
                ],
              )
            ],
          ),
        ));
  }
}

class ClientDialogAdd extends StatelessWidget {
  const ClientDialogAdd({super.key});

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
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            SimpleButtonC(
              primary: true,
              text: 'Confirmar',
            ),
            SimpleButtonC(
              text: 'Cancelar',
            )
          ],
        ),
      ],
    );
  }
}
