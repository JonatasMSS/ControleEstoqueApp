// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:genilson_app/components/ClientComponent/ClientComponent.dart';
import 'package:genilson_app/models/ClientModel/ClientModel.dart';

class DataByDay extends StatefulWidget {
  final String? title;
  final List<ClientModel>? dataChildrens;
  final String valueData;
  final bool haveChildrensNavigation;
  final bool isChildrensEditable;
  const DataByDay({
    Key? key,
    this.title,
    this.dataChildrens,
    required this.valueData,
    this.haveChildrensNavigation = false,
    this.isChildrensEditable = false,
  }) : super(key: key);

  @override
  State<DataByDay> createState() => _DataByDayState();
}

class _DataByDayState extends State<DataByDay> {
  @override
  Widget build(BuildContext context) {
    _filterDataByValueData(List<ClientModel> data) {
      final List<ClientModel> _newData =
          data.where((element) => element.date == widget.valueData).toList();
      return _newData;
    }

    List<ClientModel> _filteredData =
        _filterDataByValueData(widget.dataChildrens ?? []);

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
                  final ClientModel _myClient = _filteredData[index];

                  return ClientComponent(
                    cliente: _myClient,
                    onClickRemove: () {
                      // setState(() {
                      //   widget.dataChildrens?.removeAt(index);
                      // });
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
