// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductComponent extends StatelessWidget {
  final String description;
  final double unitValue;
  final int quantity;
  final int quantityCounter;
  const ProductComponent({
    Key? key,
    this.description = 'NO DATA',
    this.unitValue = 00.00,
    this.quantity = 0,
    this.quantityCounter = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 2),
              blurRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TEXT SECTION
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'RS $unitValue',
                  textScaleFactor: 1.1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Em estoque: $quantity',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 66, 66, 66),
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),

            CounterItem(quantity: quantityCounter),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircleAvatar(
                    backgroundColor: Color(0xFFFF4747),
                    maxRadius: 19,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                    maxRadius: 19,
                    child: Icon(
                      Icons.mode_edit_outline_outlined,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

// ignore: must_be_immutable
class CounterItem extends StatefulWidget {
  int quantity;
  CounterItem({
    Key? key,
    required this.quantity,
  }) : super(key: key);

  @override
  State<CounterItem> createState() => _CounterItemState();
}

class _CounterItemState extends State<CounterItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.quantity =
                    widget.quantity <= 0 ? 0 : widget.quantity - 1;
              });
            },
            child: const CircleAvatar(
              maxRadius: 15,
              backgroundColor: Color(0xFFFF4747),
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: 27,
              ),
            ),
          ),
          Text('${widget.quantity}'),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.quantity = widget.quantity + 1;
              });
            },
            child: const CircleAvatar(
              maxRadius: 15,
              backgroundColor: Color(0xFF6AFF79),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 27,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
