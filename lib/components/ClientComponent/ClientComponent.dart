// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ClientComponent extends StatelessWidget {
  final String? clientName;
  final String? clientNumber;

  const ClientComponent({
    Key? key,
    this.clientName,
    this.clientNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                clientName ?? 'NO DATA',
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                clientNumber ?? '(00)0000-0000',
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
              CircleAvatar(
                backgroundColor: Colors.amber,
                child: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => {},
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 254, 37, 37),
                child: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => {},
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
