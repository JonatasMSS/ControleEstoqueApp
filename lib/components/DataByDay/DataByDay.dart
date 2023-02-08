// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:genilson_app/components/ClientComponent/ClientComponent.dart';
import 'package:genilson_app/components/SimpleButtonC/SimpleButtonC.dart';
import 'package:genilson_app/database/eventsBox.dart';
import 'package:genilson_app/models/ClientModel/ClientModel.dart';
import 'package:get/get.dart';

class DataByDay extends StatefulWidget {
  final String? title;
  List<ClientModel>? dataChildrens;
  final String valueData;
  final bool haveChildrensNavigation;
  final bool isChildrensEditable;
  final EventsBox? eventsBox;
  DataByDay({
    Key? key,
    this.title,
    this.dataChildrens,
    required this.valueData,
    this.haveChildrensNavigation = false,
    this.isChildrensEditable = false,
    this.eventsBox,
  }) : super(key: key);

  @override
  State<DataByDay> createState() => _DataByDayState();
}

class _DataByDayState extends State<DataByDay> {
  @override
  Widget build(BuildContext context) {
    filterDataByValueData(List<ClientModel> data) {
      final List<ClientModel> newData =
          data.where((element) => element.date == widget.valueData).toList();
      return newData;
    }

    List<ClientModel> _filteredData =
        filterDataByValueData(widget.dataChildrens ?? []);
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 18),
      title: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 2),
          ),
        ),
        child: Text(
          widget.title ?? 'NO DATA',
          style: const TextStyle(
            color: Color.fromARGB(255, 97, 88, 88),
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      children: [
        _filteredData.isEmpty
            ? const Center(
                child: Text('Nenhum cliente adicionado!'),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _filteredData.length,
                itemBuilder: (context, index) {
                  final ClientModel myClient = _filteredData[index];

                  return ClientComponent(
                    cliente: myClient,
                    onClickRemove: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Remover cliente'),
                              content: Text(
                                "Tem certeza que deseja remover ${myClient.name}?",
                              ),
                              actions: [
                                SimpleButtonC(
                                  text: "Deletar",
                                  onClick: () {
                                    widget.eventsBox
                                        ?.removeClientById(myClient.id);

                                    Get.back(result: true);
                                  },
                                ),
                                SimpleButtonC(
                                  text: "Cancelar",
                                  primary: true,
                                  onClick: () => Get.back(result: false),
                                )
                              ],
                            );
                          }).then((value) {
                        if (value) {
                          setState(() {
                            widget.dataChildrens =
                                widget.eventsBox?.listarClientes();
                          });
                        }
                      });
                    },
                    haveNavigation: widget.haveChildrensNavigation,
                    editable: widget.isChildrensEditable,
                  );
                },
              ),
      ],
    );
  }
}
