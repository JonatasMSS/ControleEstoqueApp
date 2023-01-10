import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/ClientComponent/ClientComponent.dart';
import 'package:genilson_app/components/DataByDay/DataByDay.dart';
import 'package:genilson_app/components/InputSearchComponent/InputSearchComponent.dart';
import 'package:genilson_app/components/NavBar/NavBarComponent.dart';

import '../../models/ClientModel/ClientModel.dart';

List<String> names = [
  'marta da costa silva',
  'maercio de sousa santos',
  'josefino altos do morro',
  'cristiano ronaldo da silva',
  'antonio bandeira dos santos ',
  'rodrigo dos santos'
];

class FazerPedidoPage extends StatefulWidget {
  const FazerPedidoPage({super.key});

  @override
  State<FazerPedidoPage> createState() => _FazerPedidoPageState();
}

class _FazerPedidoPageState extends State<FazerPedidoPage> {
  //Variaveis
  List<ClientModel> testDatabase = List.generate(
    5,
    (index) => ClientModel(
        id: index,
        name: names[Random().nextInt(names.length)],
        number: 000000,
        date: 'quarta'),
  );
  late bool focusChange;
  late List<ClientModel> suggestionClients;
  late TextEditingController searchController;
  //=============================================

  @override
  void initState() {
    setState(() {
      suggestionClients = testDatabase;
      focusChange = false;
      searchController = TextEditingController();
    });
    // TODO: implement initState
    super.initState();
  }

  void searchDinamically(String query) {
    final suggestion = testDatabase.where((client) {
      final clientName = client.name.toLowerCase();
      final input = query.toLowerCase();
      return clientName.contains(input);
    }).toList();
    setState(() {
      suggestionClients = suggestion;
    });
  }

  //------------------

  @override
  Widget build(BuildContext context) {
    List<Widget> dateWidget = [
      DataByDay(
        valueData: 'terca',
        title: 'Terça-feira',
        dataChildrens: testDatabase,
      ),
      const SizedBox(
        height: 30,
      ),
      DataByDay(
        valueData: 'quarta',
        title: 'Quarta-feira',
        dataChildrens: testDatabase,
        haveChildrensNavigation: true,
      ),
      const SizedBox(
        height: 30,
      ),
      DataByDay(
        valueData: 'quinta',
        title: 'Quinta-feira',
        dataChildrens: testDatabase,
      ),
      const SizedBox(
        height: 30,
      ),
      DataByDay(
        valueData: 'sexta',
        title: 'Sexta-feira',
        dataChildrens: testDatabase,
      ),
      const SizedBox(
        height: 30,
      ),
    ];

    return GestureDetector(
      onDoubleTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      // Desfocar ao clicar na tela,
      child: Scaffold(
        backgroundColor: const Color(0xFFE4E4E4),
        appBar: NavBarComponent(NavBarTitle: 'Realizar Pedidos'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus && searchController.text.isEmpty) {
                    setState(() {
                      focusChange = !focusChange;
                    });
                  } else if (!hasFocus && searchController.text.isEmpty) {
                    setState(() {
                      focusChange = false;
                    });
                  }
                },
                child: InputSearchComponent(
                  searchController: searchController,
                  onChangedFunction: searchDinamically,
                  hintText: 'Digite o nome do cliente',
                ),
              ),
              Visibility(
                visible: !focusChange,
                replacement: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: suggestionClients.length,
                  itemBuilder: (context, index) {
                    final ClientModel myClient = suggestionClients[index];
                    return ClientComponent(
                      clientName: myClient.name,
                      clientNumber: myClient.number.toString(),
                    );
                  },
                ),
                child: Column(
                  children: [
                    ...dateWidget,
                    const Text('Escolha um cliente para continuar'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
