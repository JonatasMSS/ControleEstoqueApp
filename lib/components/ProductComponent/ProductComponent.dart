// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:genilson_app/models/ProductModel/ProductModel.dart';

class ProductComponent extends StatelessWidget {
  final ProductModel? produto;
  final Function()? onClickEdit;
  final Function()? onClickRemove;
  final bool isEditable;
  const ProductComponent({
    Key? key,
    this.produto,
    this.onClickEdit,
    this.onClickRemove,
    this.isEditable = false,
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produto?.name ?? 'NO DATA',
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'RS ${produto?.price ?? 0.00} UN',
                    textScaleFactor: 1.1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Em estoque: ${produto?.quantity ?? 0}',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 66, 66, 66),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),

            CounterItem(
              productPrice: produto!.price,
              productQuantity: produto!.quantity,
              isEditable: isEditable,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: isEditable
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: !isEditable,
                    child: Text('RS ${produto?.quantityMultplied ?? 0.0}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  GestureDetector(
                    onTap: onClickRemove,
                    child: const CircleAvatar(
                      backgroundColor: Color(0xFFFF4747),
                      maxRadius: 19,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isEditable,
                    child: GestureDetector(
                      onTap: onClickEdit,
                      child: const CircleAvatar(
                        backgroundColor: Colors.amber,
                        maxRadius: 19,
                        child: Icon(
                          Icons.mode_edit_outline_outlined,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

// ignore: must_be_immutable
class CounterItem extends StatefulWidget {
  final double productPrice;
  final int productQuantity;
  final bool isEditable;
  const CounterItem({
    Key? key,
    this.productPrice = 0,
    this.productQuantity = 0,
    required this.isEditable,
  }) : super(key: key);

  @override
  State<CounterItem> createState() => _CounterItemState();
}

class _CounterItemState extends State<CounterItem> {
  late int quantity;

  @override
  void initState() {
    quantity = 0;
    // TODO: implement initState
    super.initState();
  }

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
                quantity = quantity <= 0 ? 0 : quantity - 1;
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
          Text('$quantity'),
          GestureDetector(
            onTap: () {
              setState(() {
                quantity = widget.isEditable
                    ? quantity + 1
                    : quantity < widget.productQuantity
                        ? quantity + 1
                        : quantity;
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
