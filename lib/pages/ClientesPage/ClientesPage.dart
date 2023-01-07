import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/ClientComponent/ClientComponent.dart';
import 'package:genilson_app/components/DataByDay/DataByDay.dart';
import 'package:genilson_app/components/NavBar/NavBarComponent.dart';

class ClientesPage extends StatelessWidget {
  const ClientesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
