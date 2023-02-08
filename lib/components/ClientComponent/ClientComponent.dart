// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:genilson_app/components/ClientComponent/Dialogs/edition_dialog.dart';
import 'package:genilson_app/database/ObjectBox.dart';
import 'package:genilson_app/models/ClientModel/ClientModel.dart';

class ClientComponent extends StatelessWidget {
  ClientModel cliente;
  ObjectBox? objectBox;
  final bool editable;
  final bool haveNavigation;
  final Function()? onClickEdit;
  final Function()? onClickRemove;
  ClientComponent({
    Key? key,
    required this.cliente,
    this.objectBox,
    this.editable = false,
    this.haveNavigation = false,
    this.onClickEdit,
    this.onClickRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => haveNavigation
          ? Get.toNamed(
              '/pedidos/produtos',
              arguments: cliente.name,
            )
          : '',
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
                    backgroundColor: Colors.amber,
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) {
                            return EditionDialog(
                              cliente: cliente,
                              objectBox: objectBox,
                            );
                          }).then((value) async {
                        if (value) {
                          Get.snackbar(
                            'Cliente editado',
                            'Cliente editado com sucesso! Retornando à tela principal para atualização...',
                            backgroundColor: Colors.amber,
                            colorText: Colors.black,
                          );
                          await Future.delayed(
                              const Duration(milliseconds: 1000));
                          Get.offAllNamed('/');
                        }
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
                    backgroundColor: const Color.fromARGB(255, 254, 37, 37),
                    child: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: onClickRemove,
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
