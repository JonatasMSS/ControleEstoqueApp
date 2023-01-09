// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:genilson_app/components/ClientComponent/ClientComponent.dart';

import 'package:genilson_app/models/ClientModel/ClientModel.dart';

class DataByDay extends StatelessWidget {
  final String? title;
  final List<ClientModel>? dataChildrens;
  final String valueData;
  const DataByDay({
    Key? key,
    this.title,
    this.dataChildrens,
    required this.valueData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _filterDataByValueData(List<ClientModel> data) {
      final List<ClientModel> _newData =
          data.where((element) => element.date == valueData).toList();
      return _newData;
    }

    List<ClientModel> _filteredData =
        _filterDataByValueData(dataChildrens ?? []);

    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 18),
      title: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 2),
          ),
        ),
        child: Text(
          title ?? 'NO DATA',
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
                  final ClientModel _myClient = _filteredData[index];
                  return ClientComponent(
                    clientName: _myClient.name,
                    clientNumber: _myClient.number.toString(),
                  );
                },
              ),
      ],
    );
  }
}
