// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:genilson_app/components/ClientComponent/Dialogs/edition_dialog.dart';
import 'package:genilson_app/models/ClientModel/ClientModel.dart';

class ClientComponent extends StatelessWidget {
  final ClientModel cliente;
  final bool editable;
  final bool haveNavigation;
  final Function()? onClickEdit;
  const ClientComponent({
    Key? key,
    required this.cliente,
    this.editable = false,
    this.haveNavigation = false,
    this.onClickEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => haveNavigation ? Get.toNamed('/pedidos/produtos') : '',
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(1, 2),
                blurRadius: 5,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cliente.name,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  cliente.number.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF686868),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Visibility(
                  visible: editable,
                  child: CircleAvatar(
                    //TODO: adicionar evento de edição
                    backgroundColor: Colors.amber,
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) {
                            return EditionDialog(
                              cliente: cliente,
                            );
                          }),
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Visibility(
                  visible: editable,
                  child: CircleAvatar(
                    //TODO: Adicionar evento de exclusão
                    backgroundColor: const Color.fromARGB(255, 254, 37, 37),
                    child: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
