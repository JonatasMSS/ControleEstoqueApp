import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/ClientComponent/ClientComponent.dart';
import 'package:genilson_app/components/DataByDay/DataByDay.dart';
import 'package:genilson_app/components/InputFormComponent/InputFormComponent.dart';
import 'package:genilson_app/components/NavBar/NavBarComponent.dart';

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
      title: const Text("Criar novo cliente"),
      children: [
        InputFormComponent(
          titleForm: 'Nome do cliente',
          placeholder: 'Nome do cliente',
        ),
        const SizedBox(
          height: 20,
        ),
        InputFormComponent(
          titleForm: 'Numero',
          placeholder: 'Numero do cliente',
        ),
      ],
    );
  }
}
