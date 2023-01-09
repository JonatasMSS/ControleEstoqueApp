import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/DataByDay/DataByDay.dart';
import 'package:genilson_app/components/InputSearchComponent/InputSearchComponent.dart';
import 'package:genilson_app/components/NavBar/NavBarComponent.dart';

import '../../models/ClientModel/ClientModel.dart';

class FazerPedidoPage extends StatelessWidget {
  const FazerPedidoPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Testing
    List<String> values = ['terca', 'quarta', 'quinta', 'sexta'];
    List<String> names = [
      'joao',
      'maria',
      'josefina',
      'carlitos',
      'santos',
      'alexandremota'
    ];

    final List<ClientModel> _testDatabase = List.generate(
      20,
      (index) => ClientModel(
        id: index,
        name: names[Random().nextInt(names.length)],
        number: 00000000,
        date: values[Random().nextInt(values.length)],
      ),
    );

    //------------------
    List<Widget> dateWidget = [
      DataByDay(
        valueData: 'terca',
        title: 'Terça-feira',
        dataChildrens: _testDatabase,
      ),
      const SizedBox(
        height: 30,
      ),
      DataByDay(
        valueData: 'quarta',
        title: 'Quarta-feira',
        dataChildrens: _testDatabase,
      ),
      const SizedBox(
        height: 30,
      ),
      DataByDay(
        valueData: 'quinta',
        title: 'Quinta-feira',
        dataChildrens: _testDatabase,
      ),
      const SizedBox(
        height: 30,
      ),
      DataByDay(
        valueData: 'sexta',
        title: 'Sexta-feira',
        dataChildrens: _testDatabase,
      ),
      const SizedBox(
        height: 30,
      ),
    ];

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus
          ?.unfocus(), // Desfocar ao clicar na tela,
      child: Scaffold(
        backgroundColor: const Color(0xFFE4E4E4),
        appBar: NavBarComponent(NavBarTitle: 'Realizar Pedidos'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const InputSearchComponent(
                hintText: 'Digite o nome do cliente',
              ),
              ...dateWidget,
            ],
          ),
        ),
      ),
    );
  }
}
