// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:genilson_app/components/ClientComponent/ClientComponent.dart';
import 'package:genilson_app/components/DataByDay/DataByDay.dart';
import 'package:genilson_app/components/InputSearchComponent/InputSearchComponent.dart';
import 'package:genilson_app/components/NavBar/NavBarComponent.dart';
import 'package:genilson_app/database/ObjectBox.dart';
import 'package:genilson_app/database/eventsBox.dart';
import 'package:genilson_app/main.dart';

import '../../models/ClientModel/ClientModel.dart';

class FazerPedidoPage extends StatefulWidget {
  ObjectBox objectBox;

  FazerPedidoPage({
    Key? key,
    required this.objectBox,
  }) : super(key: key);

  @override
  State<FazerPedidoPage> createState() => _FazerPedidoPageState();
}

class _FazerPedidoPageState extends State<FazerPedidoPage> {
  //Variaveis
  late List<ClientModel> clients;
  late EventsBox eventsBox;
  late bool focusChange;
  late List<ClientModel> suggestionClients;
  late TextEditingController searchController;
  //=============================================

  @override
  void initState() {
    setState(() {
      eventsBox = EventsBox(boxDatabase: objectBox);
      clients = eventsBox.listarClientes();
      suggestionClients = clients;
      focusChange = false;
      searchController = TextEditingController();
    });

    super.initState();
  }

  void searchDinamically(String query) {
    final suggestion = clients.where((client) {
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
        valueData: 'segunda',
        dataChildrens: clients,
        title: 'Segunda-feira',
        haveChildrensNavigation: true,
      ),
      const SizedBox(
        height: 30,
      ),
      DataByDay(
        valueData: 'terca',
        title: 'Terça-feira',
        dataChildrens: clients,
        haveChildrensNavigation: true,
      ),
      const SizedBox(
        height: 30,
      ),
      DataByDay(
        valueData: 'quarta',
        title: 'Quarta-feira',
        dataChildrens: clients,
        haveChildrensNavigation: true,
      ),
      const SizedBox(
        height: 30,
      ),
      DataByDay(
        valueData: 'quinta',
        title: 'Quinta-feira',
        dataChildrens: clients,
        haveChildrensNavigation: true,
      ),
      const SizedBox(
        height: 30,
      ),
      DataByDay(
        valueData: 'sexta',
        title: 'Sexta-feira',
        dataChildrens: clients,
        haveChildrensNavigation: true,
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
                      haveNavigation: true,
                      cliente: myClient,
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
